trigger OpportunityList on Opportunity (after insert,after update) {
    set<Id> AccId = new set<Id>();
    for(Opportunity oop : trigger.new){
        AccId.add(oop.AccountId);
    }
    List<Account> listAcc = new List<Account>();
    Map<Id,String> mapAcc = new Map<Id,String>();
    for(Opportunity op : [select Id,Name,CloseDate,AccountId from Opportunity where AccountId IN:AccId]){
        if(mapacc.containsKey(op.AccountId)){
            String nm = mapacc.get(op.AccountId);
            nm = nm+op.Name;
            mapacc.put(op.AccountId,nm);
        }
        else{
            mapacc.put(op.AccountId,op.Name);
        }
    }
    
    for(Account acc : [select Id,cNames__c from Account where Id IN:mapacc.keySet()]){
        acc.cNames__c = mapacc.get(acc.Id);
        listacc.add(acc);
    }
    update listacc;
}