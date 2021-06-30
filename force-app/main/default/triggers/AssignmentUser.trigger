//If on User managerId is changed then update opportunity owners manager field.
trigger AssignmentUser on User (After Update) {
    if(trigger.isExecuting && trigger.isAfter &&  Trigger.isUpdate){
        List<Opportunity> list2 = new List<Opportunity>();
        Map<Id,User> map1 = new map<Id,User>();
        for(User u : trigger.new){
            if(u.ManagerId<>Trigger.oldmap.get(u.Id).ManagerId){
                map1.put(u.Id,u);
            }
            if(map1.size()>0){
                for(Opportunity o : [select Id,OwnerId,Owners_Manager__c from Opportunity where OwnerId IN:map1.keyset()]){
                    o.Owners_Manager__c = map1.get(o.OwnerId).ManagerId;
                    list2.add(o);
                }
            }
        }
        update list2;
    }
}