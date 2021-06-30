/*
 1. Prefix First Name with Dr when new lead is created or updated.
 2. Object used - Lead
 3. Event - Before
 4. DML - insert,update
 5. Author - Tejas
*/

trigger leadPrefixWithDr on Lead (before insert,before update) {
	
   // if(Trigger.isExecuting && Trigger.isBefore && (Trigger.isInsert || Trigger.isUpdate)){
        for(Lead leadRec : trigger.new){
            leadRec.FirstName = 'Dr' + leadRec.FirstName;
        }
    //}
}