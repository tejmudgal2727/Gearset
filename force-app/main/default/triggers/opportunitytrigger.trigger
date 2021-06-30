trigger opportunitytrigger on Opportunity (before update) {
 Set<Id> setUserIds = new Set<Id>();
 
  //holds a list of Users
  List<User> lstUser = new List<User>();
 
  //holds key value pairs of User Id and User Object
  Map<Id, User> mapUserObj = new Map<Id, User>();

  //holds User object
  User UserObj;
   
  //For each opportunity being inserted add User Id value in in Set of User Ids.
  for(Opportunity oppObj : Trigger.new){
    if(oppObj.OwnerId != null){
      setUserIds.add(oppObj.OwnerId);
    }
  }
 
  //Fetch all Users whose Id is in the Set.
  lstUser = [select Id, Name, ManagerId from User where Id in :setUserIds Limit 1000];
  if(lstUser.size() == 0){
    return;  
  }
 
  //Add these fetched Users in a Map <User Id, User object>
  for(User usrObj : lstUser){
    mapUserObj.put(usrObj.Id, usrObj);  
  }
 
  //for each opportunity being inserted get User from the map and update the field values
  for(Opportunity oppObj : Trigger.new){
    //get User object
    if(oppObj.OwnerId != null){
      if(mapUserObj.containsKey(oppObj.OwnerId)){
        UserObj = mapUserObj.get(oppObj.OwnerId);
        //map opportunity fields to User fields
        oppObj.City__c = UserObj.ManagerId;
      }  
    }
  }
}