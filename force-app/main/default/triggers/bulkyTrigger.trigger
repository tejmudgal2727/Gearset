trigger bulkyTrigger on Contact (after insert,after update) {
    Set<Id> accId = new Set<Id>();
    for(Contact con : trigger.new){
        accId.add(con.AccountId);
    }
    List<Account> listAcc = new List<Account>();
    Map<Id,String> Accmap = new Map<Id,String>();
    for(Contact cont : [select Id,FirstName,LastName,AccountId from Contact where AccountId IN : accId]){
        if(Accmap.containsKey(Cont.AccountId)){
            String nm = Accmap.get(cont.AccountId);
            nm = nm+Cont.FirstName;
            Accmap.put(Cont.AccountId,nm);
        }
        else{
            Accmap.put(Cont.AccountId,Cont.FirstName);
        }
    }
    for(Account acc : [select Id,CNames__c,(Select Id,FirstName,LastName from Contacts) from account where Id IN:Accmap.keySet()]){
        acc.CNames__c = Accmap.get(acc.Id);
        listAcc.add(acc);
    }
    update listAcc;
}