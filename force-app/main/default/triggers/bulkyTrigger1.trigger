trigger bulkyTrigger1 on Contact (after insert,after update) {
    set<Id> accId = new Set<Id>();
    system.debug('Set Contains : '+accID);
    for(Contact con : trigger.new){
        accId.add(con.AccountId);
    }
    List<Account> Acclist = new List<Account>();
    Map<Id,String> mapAcc = new Map<Id,String>();
    for(Contact cont : [select Id,FirstName,LastName,AccountId from Contact where AccountId IN:accId]){
        if(mapAcc.containsKey(Cont.AccountId)){
            String nm = mapAcc.get(Cont.AccountId);
            System.debug('String nm Contains : '+nm);
            nm = nm+Cont.FirstName;
            mapAcc.put(Cont.AccountId,nm);
        }
        else{
            mapAcc.put(Cont.AccountId,Cont.FirstName);
        }
    }
    for(Account acc : [select Id,CNames__c from Account where Id IN:mapAcc.keySet()]){
        acc.cNames__c = mapAcc.get(acc.Id);
        acclist.add(acc);
    }
    
    update acclist;
}