// Whenever a case is created with origin as email then set status as new and Priority as Medium.
trigger Caseorigin on Case (before insert) {
    if(Trigger.isExecuting && Trigger.isBefore && Trigger.isInsert){
        for(Case c : Trigger.New){
            if(c.Origin == 'Email'){
                c.Status = 'New';
                c.Priority = 'Medium';
            }
        }
    }
}