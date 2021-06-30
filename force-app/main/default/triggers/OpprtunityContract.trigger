trigger OpprtunityContract on Opportunity (After insert, After Update) {
    
    List<Contract> cont = new List<Contract>();
    
    if(Trigger.isExecuting && Trigger.isAfter && (Trigger.isInsert || Trigger.isUpdate)){
        try{
        for(Opportunity opp : Trigger.New){
            if(opp.StageName=='Closed Won'){
                Contract ct = new Contract();
               // ct.AccountId = opp.AccountId;
                ct.Name=opp.Name;
                ct.Status='Draft';
                ct.StartDate=System.today()+2;
                ct.ContractTerm=12;
                ct.OppContract__c=opp.Id;
                cont.add(ct);
            }
        }
        
        insert cont;
        }
        catch(Exception ex){
            System.debug('@@@ Exception Occur : '+ex.getMessage());
            System.debug('Line Number : '+ex.getLineNumber());
            System.debug('Get Causes : '+ex.getCause());
            System.debug('Stack : '+ex.getStackTraceString());
            System.debug('Name : '+ex.getTypeName());
        }
    }

}