trigger AvoidDeleteRecords on Account (before delete) {
    if(Trigger.isExecuting && Trigger.isBefore && Trigger.isDelete){
        for(Account Acc : Trigger.old){
           // if(Acc.StatusCheck__c = True){
                Acc.AddError('You Can not delete active Accounts');
            //
            //}
        }
    }
}