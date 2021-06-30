public class NewBatchClass implements database.batchable<sObject> {
    public database.QueryLocator start(database.BatchableContext bc){
        return database.getQueryLocator([select Id,FirstName,LastName,Leadsource from contact where Leadsource='web']);
    }
    public void Execute(database.BatchableContext bc , List<Contact> Scope){
        for(Contact objcontact : Scope){
            objContact.firstName = objcontact.firstname + 'WebContactor';
        }
        update scope;
    }
    public void finish(database.BatchableContext bc){
        
    }
}