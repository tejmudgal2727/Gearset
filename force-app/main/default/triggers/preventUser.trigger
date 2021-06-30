trigger preventUser on Contact (before delete) {
    
    if(trigger.isExecuting && trigger.isbefore && trigger.isdelete){
        for(contact cont : trigger.old){
            if(cont.AccountId==null){
                cont.AddError('Hey You are not authorized to perform this action');
            }
        }
    }

}