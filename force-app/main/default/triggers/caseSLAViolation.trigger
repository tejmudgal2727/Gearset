//If Case SLA Violatation(checkbox) is yes then status should be true and case age (picklist Type) should be new.


trigger caseSLAViolation on Case (before insert,before update) {
    
    if(trigger.isExecuting && trigger.isBefore && (trigger.isInsert || trigger.isUpdate)){
        for(Case c : trigger.new){
            if(c.SLA_Violation__c==true){
                c.Status='True';
                c.Case_Age__c='New';
            }
        }
    }

}