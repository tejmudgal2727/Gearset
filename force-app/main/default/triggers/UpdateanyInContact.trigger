trigger UpdateanyInContact on Account (After Update) {
    Map<Id,Account> mapAcc = new Map<Id,Account>();
    List<Contact> conList = new List<Contact>();
    if(Trigger.isExecuting && Trigger.isAfter && Trigger.isupdate){
        for(Account ac : trigger.new){
            if(ac <> trigger.oldmap.get(ac.Id)){
                mapAcc.put(ac.Id,ac);
            }
            if(mapAcc.size()>0){
                conList = [select Id,LastName,FirstName,AccountId from Contact where accountId IN:mapAcc.keyset()];
            }
        }
        TriggerHandlerAccountContact.method2(mapAcc,conList);
    }
}