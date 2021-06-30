trigger jobApplicationupdate on Positi__c (After update) {
    
    Map<Id,Positi__c> mapPosition = new Map<Id,Positi__c>();
    List<Job_Application__c> joblist = new List<Job_Application__c>();
     List<Job_Application__c> joblist1 = new List<Job_Application__c>();
    
    if(Trigger.isExecuting && Trigger.isAfter && Trigger.isUpdate){
        for(Positi__c P : trigger.New){
            if(p.Status__c <> Trigger.oldMap.get(p.Id).Status__C){
                mapPosition.put(p.Id,p);
            }
            if(mapPosition.size()>0){
                joblist = [select Id,Description__c,PositionAndJob__c from Job_Application__c where PositionAndJob__c IN:mapPosition.keySet()];
            }
            if(joblist.size()>0){
                for(Job_Application__c jo : joblist){
                    jo.Description__c = mapPosition.get(jo.PositionAndJob__c).Status__c;
                    joblist1.add(jo);
                }
            }
        }
        update joblist1;
    }
}