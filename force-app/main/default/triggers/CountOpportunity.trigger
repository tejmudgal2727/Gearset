trigger CountOpportunity on Opportunity (After insert,after delete) {
    if(trigger.isExecuting && Trigger.isAfter){
       Map<Id,opportunity> oppMap = new Map<Id,opportunity>();
        if(Trigger.isInsert){
        for(opportunity op : Trigger.new){
            oppMap.put(op.AccountId,op);
        }
        }
        if(trigger.isDelete){
        for(Opportunity opp : trigger.old){
            oppMap.put(opp.AccountId,opp);
        }
        }
         oppotunityTriggerHandler.oppMethod(oppMap);
     }
}