trigger TasksComplted on Opportunity (before Insert , before Update) {

    if(Trigger.isExecuting && Trigger.isBefore &&  Trigger.isInsert )
    {
    
    for(Opportunity opp : Trigger.New)
    {
    
    if(opp.LeadSource == 'Web')
    {
    
    opp.Type = 'New Customer';
    
    }
    }
    }
    
    if(Trigger.isExecuting && Trigger.isBefore && Trigger.isUpdate)
    {
        
        for (opportunity o : Trigger.New)
        {    
     if(o.StageName == 'Closed Won'){
    
    o.Description = 'Closed Won';
    
    }
    }
    }
    
    
    
    
    
    
    }