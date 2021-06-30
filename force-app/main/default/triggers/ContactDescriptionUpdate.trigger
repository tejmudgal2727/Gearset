// Contact Description update where the account is updated.
trigger ContactDescriptionUpdate on Account (after update) {
    
    Map<Id,Account> mapAccount = new Map<Id,Account>();
    List<Contact> listContact = new List<Contact>();
    List<Contact> updateList = new List<Contact>();
    
    for(Account Acc : Trigger.New){
        // old value should not be same the new value
        if(Acc.Industry <> Trigger.oldMap.get(Acc.Id).Industry){
            mapAccount.put(Acc.Id,Acc);
        }
        if(mapAccount.size()>0){
           listContact  = [select Id,LastName,Description,AccountId from Contact where AccountId IN:mapAccount.keySet()];
            
        }
        if(listContact.size()>0){
            for(Contact con : listContact){
                con.Description = mapAccount.get(con.AccountId).Industry;
                updateList.add(con);
            }
        }
    }
    update updatelist;
}