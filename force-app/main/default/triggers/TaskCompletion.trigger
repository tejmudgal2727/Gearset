trigger TaskCompletion on Contact (before insert , before update) {
    
    if(Trigger.isExecuting && Trigger.isBefore && (Trigger.isInsert || Trigger.isUpdate))
    {
    
    /*for(Contact con : Trigger.New)
    {
    
    if(con.Email != NULL && con.Phone !=NULL)
    {
    
    con.Description = 'Finance';
    
    
    
    }
   
    
    
    
    
    }*/
    
    ContactTriggerHandler.contactHandler(trigger.new);
    
        ContactTriggerHandler.ContactHandler1(trigger.new);
    
    }

}