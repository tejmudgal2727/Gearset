// If Contact is Updated in the City of the Account put firstName.

trigger ContactToAcount on Contact (after update) {
    
    Map<Id,Contact> Mapcon = new Map<Id,Contact>();
    List<Account> AccList = new List<Account>();
    List<Account> AccList1 = new List<Account>();
    
    if(trigger.isExecuting && trigger.isAfter && trigger.isUpdate){
        try{
            for(Contact con : trigger.new){
                if(con<>trigger.oldmap.get(con.Id)){
                    Mapcon.put(con.AccountId,con);
                }
                if(Mapcon.size()>0){
                    AccList = [select Id,Name,City__c from Account where Id =:Mapcon.keySet()];
                }
                if(AccList.size()>0){
                    for(Account a : AccList){
                        a.City__c = Mapcon.get(a.Id).FirstName;
                        AccList1.add(a);
                    }
                }
            }
            if(AccList1.size()>0){
                Update AccList1;
            }
        }
        Catch(Exception ex){
            system.debug('Get Error : '+ex.getMessage());
        }
    }

}