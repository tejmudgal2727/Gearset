trigger countdeleteattempt on Account (before delete) {
   set<Id> accSet = new set<Id>();
        for(account acc : trigger.old){
        accset.add(acc.id);
    }
    map<Id,account> mapAcc = new map<Id,account>([select id,NumberofLocations__c,(select id from contacts) from account where Id =: accset]);
    for(Account ac : trigger.old){
        if(mapAcc.get(ac.id).contacts.size()>0){
          ac.adderror('you can not');
        }
    }
}