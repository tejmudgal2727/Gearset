// If Contact Salutation is updated then put into Account Name.

trigger ContactToAccount on Contact (After update) {

    map<Id,Contact> mapcon = new Map<Id,Contact>();
    List<Account> list1 = new List<Account>();
    List<Account> list2 = new List<Account>();
        
    if(Trigger.isExecuting && Trigger.isAfter && Trigger.isUpdate){
        for(Contact c : trigger.new){
            if(c.Salutation!=trigger.oldmap.get(c.Id).Salutation){
                mapcon.put(c.AccountId,c);
            }
            if(mapcon.size()>0){
               list1 = [select Id,Name,type from account where Id=:mapcon.keySet()];
            }
            if(list1.size()>0){
                for(Account ac : list1){
                    
                ac.Type='Cash';
                    list2.add(ac);
                }
                    
                
            }
            
        }
        update list2;
    }
}