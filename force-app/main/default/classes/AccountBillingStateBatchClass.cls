public class AccountBillingStateBatchClass implements database.batchable<sObject> {
    public database.QueryLocator start(database.BatchableContext bc){
        return database.getQueryLocator([select Id,BillingState,BillingCountry from Account where BillingCountry='USA' AND BillingState=null]);
    }
    
    public void Execute(database.BatchableContext bc , List<Account> listofAccount){
        for(Account objaccount : listofAccount){
            objaccount.BillingState = 'California';
        }
        
        update listofaccount;
    }
    
    public void finish(database.BatchableContext bc){
        
    }
}