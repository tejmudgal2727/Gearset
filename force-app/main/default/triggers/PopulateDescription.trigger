trigger PopulateDescription on Contact (before insert) {

    if(trigger.isExecuting && trigger.isBefore && trigger.isinsert){
        for(Contact cont : trigger.new){
            cont.Description = ' Contact created successfully';
        }
    }
}