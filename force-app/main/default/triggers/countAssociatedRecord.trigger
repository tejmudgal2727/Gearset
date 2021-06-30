trigger countAssociatedRecord on Contact (After insert) {
    Map<Id,contact> mapCon = new Map<Id,Contact>();
    List<Account> accList = new List<Account>();
    List<Contact> conList = new List<Contact>();
    List<Account> accList1 = new List<Account>();
    if(trigger.isExecuting && trigger.isAfter && trigger.isInsert){
        for(contact con : Trigger.New){
            mapCon.put(con.AccountId,con);
        }
        if(mapCon.size()>0){
            accList = [select Id,Name,Number_Of_Contacts__c from account where Id =: mapCon.keySet()];
            conList = [select Id,LastName,AccountId from Contact where AccountId =: mapCon.keySet()];
        }
        if(accList.size()>0){
            for(Account acc : accList){
                acc.Number_Of_Contacts__c = conList.size();
                accList1.add(acc);
            }
            update accList1;
        }
    }
}