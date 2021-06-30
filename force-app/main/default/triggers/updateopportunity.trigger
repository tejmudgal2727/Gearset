trigger updateopportunity on Opportunity (before update) {
    set<Id> Opportunityset = new set<Id>();
    List<User> Userlist = new List<User>();
    Map<Id,User> Usermap = new Map<Id,User>();
    User objuser1;
    for(Opportunity objopp : trigger.new){
        if(objopp.ownerId != Null){
            Opportunityset.add(objopp.ownerId);
        }
        if(Opportunityset.size()>0){
            Userlist = [select Id,Name,ManagerId from User where Id IN : Opportunityset];
        }
        if(Userlist.size()>0){
            for(User objuser : Userlist){
                Usermap.put(objuser.Id,objuser);
            }
            for(Opportunity opty : Trigger.new){
                if(opty.ownerId != Null){
                    if(Usermap.containskey(opty.ownerId)){
                        objuser1 = Usermap.get(opty.ownerId);
                          opty.OwnerManagerId__c = objUser1.ManagerId;
                   }
                }
            }
        }
    }
}