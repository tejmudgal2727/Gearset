trigger RememberContact on Contact (After insert,after update) {
    if(Trigger.isExecuting && Trigger.isAfter && (Trigger.isInsert || Trigger.isUpdate)){
        set<Id> setofAccountId = new set<Id>();
        for(Contact con : Trigger.new){
            setofAccountId.add(con.AccountId);
        }
        
        List<Account> ListofAccount = new List<Account>();
        Map<Id,String> mapofcontact = new map<Id,String>();
        for(Contact con : [select Id,firstname,lastname,accountId from contact where accountId IN :setofAccountId]){
            if(mapofcontact.containsKey(con.AccountId)){
                string nm = mapofcontact.get(con.accountId);
                nm = nm+con.firstname;
                mapofcontact.put(con.accountId,nm);
            }
            else{
                mapofcontact.put(con.accountId,con.firstname);
            }
    }
        for(Account acc : [select Id,CNames__c from account where Id IN : mapofcontact.keySet()]){
            acc.CNames__c = mapofcontact.get(acc.Id);
            listofaccount.add(acc);
        }
    update listofaccount;
}
}