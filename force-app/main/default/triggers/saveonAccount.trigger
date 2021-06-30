trigger saveonAccount on Contact (after insert,after update) {
    set<Id> acctId = new Set<Id>();
    for(Contact con : trigger.new){
        acctId.add(con.accountId);
    }
    
    List<Account> acctupdate = new List<Account>();
    List<String> names = new List<String>();
    
    for(Account acc : [select Id,Cnames__c ,(select FirstName,LastName from Contacts) from Account where Id =: acctId]){
        for(Contact cont : acc.Contacts){
            if(cont.LastName!=null){
                names.add(cont.firstname);
            }
        }
        
        acc.Cnames__c=String.join(names,',');
        acctupdate.add(acc);
    }
    
    update acctUpdate;
}