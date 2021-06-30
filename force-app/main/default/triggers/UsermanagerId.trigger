// If on User ManagerId is changed then update the opportunity owner manager Id.
trigger UsermanagerId on User (after update) {
	Map<Id,User> mapUser = new Map<Id,User>();
    List<Opportunity> olist = new List<Opportunity>();
    for(User U : Trigger.new){
        if(u.ManagerId <> Trigger.oldmap.get(u.Id).ManagerId){
            mapuser.put(u.Id,U);
        }
        if(mapUser.size()>0){
            for(Opportunity o : [select Id,OwnerId,Owners_Manager__c from opportunity where OwnerId =: mapuser.keySet()]){
                o.Owners_Manager__c = mapuser.get(u.Id).ManagerId;
                olist.add(o);
            }
        }
    }
    update olist;
}