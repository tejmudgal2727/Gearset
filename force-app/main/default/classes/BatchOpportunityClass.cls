public class BatchOpportunityClass implements database.Batchable<sObject> {
    public String ls = 'web';
    public database.QueryLocator start(database.BatchableContext bc){
        return database.getQueryLocator([select Id,Name,LeadSource,City__c from Opportunity where LeadSource=:ls]);
    }
    public void Execute(Database.BatchableContext bc,List<Opportunity> listOpportunity){
        for(opportunity op : listOpportunity){
            op.City__c='pune';
        }
        Update listopportunity;
    }
    public void Finish(Database.BatchableContext bc){
        
    }
}