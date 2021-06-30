global class AccountUpdateBatch implements Database.Batchable<sObject> {
    public database.QueryLocator start(database.BatchableContext bc){
        return database.getQueryLocator([select Id,Name from Account]);
    }
    
    public void Execute(database.BatchableContext bc , List<Account> ListofAccount){
        for(Account objAccount : ListofAccount){
            objAccount.Name = objAccount.Name + 'BatchUpdate';
        }
        update ListofAccount;
    }
    
    public void Finish(database.BatchableContext bc){
        
    }
}