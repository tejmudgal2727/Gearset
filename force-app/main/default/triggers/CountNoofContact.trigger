trigger CountNoofContact on Contact (After Insert,After Delete,After Undelete) {
    Set<Id> setCon = new Set<Id>();
    if(Trigger.isExecuting && Trigger.isAfter){
        if(Trigger.isInsert){
        for(Contact con : Trigger.new){
            setCon.add(con.AccountId);
            System.debug('setCon Contains :- '+setCon);
        }
        }
        if(Trigger.isDelete){
            for(Contact con1 : Trigger.old){
               setCon.add(con1.AccountId); 
            }
        }
        if(Trigger.isUndelete){
            for(Contact con2 : Trigger.New){
                setCon.add(con2.AccountId);
            }
        }
    }
    TriggerHandlerContact.ContactMethod(setCon);
}