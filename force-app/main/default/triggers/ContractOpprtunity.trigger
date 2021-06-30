trigger ContractOpprtunity on Opportunity (after insert , after update) {
    
    List<Contract> cont = new List<Contract>();
    
    if(trigger.isExecuting && trigger.isAfter && (trigger.isInsert || trigger.isUpdate)){
        try{
            for(Opportunity o : trigger.new){
                if(o.StageName =='Closed Won'){
                    Contract ct = new Contract();
                    ct.AccountId = o.AccountId;
                    ct.Name = o.Name;
                    ct.status = 'Draft';
                    ct.ContractTerm=167;
                    ct.StartDate=system.today()+3;
                     ct.OppContract__c=o.Id;
                    cont.add(ct);
                }
                
                
           
        }
             
                    insert cont;
                   
            
    }
        catch(Exception ex){
            
        }

}
}