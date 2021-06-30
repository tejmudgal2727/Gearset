// If Opportunity is Created with Closed Won then Create a Contract below Account and Opportunity.
// If the Opportunity is Updated with the Closed Lost then update all the Contract with start date as Today.


trigger OppContractUpdate on Opportunity (after insert,after Update) {
    
    List<Contract> ContractList = new List<Contract>();
    Map<Id,Opportunity> OpprMap = new Map<Id,Opportunity>();
    List<Contract> ContractList1 = new List<Contract>();
    List<Contract> ContractList2 = new List<Contract>();
    
    if(trigger.isExecuting && Trigger.isAfter){
        try{
            for(Opportunity op : Trigger.New){
                if(Trigger.isInsert && op.StageName=='Closed Won'){
                    Contract ct = new Contract();
                    ct.AccountId = op.AccountId;
                    ct.Status = 'Draft';
                    ct.StartDate = System.today()+3;
                    ct.OppContract__c = op.Id;
                    ContractList.add(ct);
                    System.debug('Values of ContractList : '+ContractList);
                }
                else if(Trigger.isUpdate && op.StageName=='Closed Lost'){
                    OpprMap.put(op.Id,op);
                    if(OpprMap.size()>0){
                        ContractList1 = [Select Id,StartDate,OppContract__r.Id from Contract where OppContract__r.Id =:OpprMap.keySet() ];
                    }
                    if(ContractList1.size()>0){
                        for(Contract cont : ContractList1){
                            cont.StartDate = System.today();
                            cont.Description = OpprMap.get(cont.OppContract__r.Id).Name;
                            ContractList2.add(cont);
                            System.debug('List of Contract : '+ContractList2);
                        }
                    }
                }
            }
            insert ContractList;
            Update ContractList2;
        }
        catch(Exception ex){
            System.debug('Get Execption : '+ex.getMessage());
        }
    }

}