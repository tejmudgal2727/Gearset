trigger NewFriday on Case (before insert , before update) {

    if(Trigger.isExecuting && Trigger.isBefore)
    {
    
    for(Case c : Trigger.New)
    {
    
    if(Trigger.isInsert && c.Origin == 'Phone')
    {
    
    c.Priority = 'High';
    
    
    
    }
    else if(Trigger.isUpdate && c.Origin == ' Email')
    {
    
    c.priority = 'low';
    
    
    }
    
    
    
    }
    
    
    
    }
    
    


}