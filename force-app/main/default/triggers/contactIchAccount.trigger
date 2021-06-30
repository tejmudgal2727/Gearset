//If Contact is Updated in the City of the Account put firstName.



trigger contactIchAccount on Contact (after update) {

    Map<Id,Contact> mapcon = new Map<Id,Contact>();
    List<Account> accountlist1 = new List<Account>();
    List<Account> accountlist2 = new List<Account>();
    
    if(trigger.isExecuting && trigger.isAfter && trigger.isUpdate){
        try{
            for(Contact con : trigger.new){
                if(con <> trigger.oldmap.get(con.id)){
                    mapcon.put(con.AccountId ,con);
                }
                if(mapcon.size()>0){
                    accountlist1 = [select Id,name,City__c from Account where Id =:mapcon.keySet()];
                }
                if(accountlist1.size()>0){
                    for(Account a : accountlist1){
                        a.City__c = mapcon.get(a.Id).firstname;
                        accountlist2.add(a);
                    }
                }
            }
            if(accountlist2.size()>0){
                update accountlist2;
            }
        }
        catch(Exception ex){
            system.debug('Error Occured : '+ex.getMessage());
        }
    }
}