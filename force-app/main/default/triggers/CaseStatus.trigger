trigger CaseStatus on Case (before insert,before update) {
    
    if(trigger.isExecuting && trigger.isBefore && (trigger.isInsert || trigger.isUpdate)){
        
        for(Case c : trigger.new){
            if(c.Status=='Escalated'){
                c.Priority='High';
                c.checkstatus__c=True;
            }
        }
    }

}