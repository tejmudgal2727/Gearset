trigger onContactTrigger on Contact (after update) {
    Map<Id,Contact> mapCon = new Map<Id,Contact>();
    List<Account> accList = new List<Account>();
    List<Account> accList1 = new List<Account>();
    
    if(Trigger.isExecuting && Trigger.isAfter && Trigger.isupdate){
        
        for(Contact con : Trigger.new){
            if(con.LeadSource != Trigger.oldMap.get(con.Id).LeadSource){
                mapCon.put(con.AccountId,con);
            }
            if(mapCon.size()>0){
                accList = [select Id,city__c,Name from Account where Id =:mapCon.keySet()];
            }
            if(accList.size()>0){
                for(Account ac : accList){
                    ac.city__c = mapCon.get(con.AccountId).LeadSource;
                    accList1.add(ac);
                }
            }
        }
        update accList1;
    }
}