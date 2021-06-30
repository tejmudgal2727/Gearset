trigger UpdateContact on Account (after update) {
    // Creating Map for Account Object.
    Map<Id,Account> mapAcc = new Map<Id,Account>();
    List<Contact> con1 = new List<Contact>();
    
    if(Trigger.isExecuting && Trigger.isAfter && Trigger.isUpdate){
        for(Account acc : Trigger.New){
            // Here We are comparing new value is not same to old value.
            if(acc.Industry <> Trigger.oldmap.get(acc.Id).Industry){
                mapAcc.put(acc.Id,acc);
            }
            if(mapAcc.size()>0){
                 con1 = [select Id,Description,AccountId from Contact Where AccountId IN: mapAcc.keyset()];
                
            }
            
        }
        TriggerHandlerAccountContact.Method1(mapAcc,con1);
    }
}