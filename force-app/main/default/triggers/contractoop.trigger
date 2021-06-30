// If Opportunity is Created with Closed Won then Create a Contract below Account and Opportunity.
// If the Opportunity is Updated with the Closed Lost then update all the Contract with start date as Today.


trigger contractoop on Opportunity (after insert,after update) {
    
    List<Contract> contractlist = new List<Contract>();
    Map<Id,Opportunity> mapOp = new Map<Id,Opportunity>();
    List<Contract> contractlist1 = new List<Contract>();
    List<Contract> contractlist2 = new List<Contract>();
    
    if(trigger.isExecuting && trigger.isAfter){
        try{
            for(Opportunity oop : trigger.new){
                if(trigger.isInsert && oop.StageName=='Closed Won'){
                    Contract ct = new Contract();
                    ct.AccountId = oop.AccountId;
                    ct.Status='Draft';
                    ct.ContractTerm=10;
                    ct.StartDate=system.today()+3;
                    ct.OppContract__c=oop.Id;
                    contractlist.add(ct);
                }
                else if(trigger.isUpdate && oop.StageName=='Closed Lost'){
                    mapOp.put(oop.Id,oop);
                    if(mapOp.size()>0){
                        contractlist1 = [select Id,startDate,OppContract__r.Id from Contract where OppContract__r.Id=:mapOp.keySet()];
                    }
                    if(contractlist1.size()>0){
                        for(Contract cont : contractlist1){
                            cont.startDate = system.today();
                            contractlist2.add(cont);
                        }
                    }
                }
            }
            insert contractlist;
            update contractlist2;
     
        }
        catch(Exception ex){
            system.debug('Error Occured : '+ex.getMessage());
        }
    }

}