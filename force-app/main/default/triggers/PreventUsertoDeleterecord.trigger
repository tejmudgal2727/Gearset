trigger PreventUsertoDeleterecord on Account (before delete) {
    if(trigger.isExecuting && trigger.isBefore && Trigger.isdelete){
        for(Account acc : Trigger.old){
            if(acc.Match_Billing_Address__c == True){
                acc.addError('You are not able to delete record because match billing address is active');
            }
        }
    }
}