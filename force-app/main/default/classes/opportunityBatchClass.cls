public class opportunityBatchClass implements database.Batchable<sobject>{
    public database.QueryLocator start(database.BatchableContext bc){
        return database.getQueryLocator([select Id,Name,StageName,City__c from opportunity where StageName = 'Closed Won']);
    }
    public void Execute(database.BatchableContext bc , List<opportunity> scope){
        List<opportunity> oppList = new List<Opportunity>();
        for(opportunity op : scope){
            op.City__c = 'Nagpur';
            oppList.add(op);
        }
        update oppList;
    }
    public void finish(database.BatchableContext bc){
        
    }
}