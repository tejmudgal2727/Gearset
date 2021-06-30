@isTest
public class AccountUpdateBatchTest {
    @TestsetUp static void TestData(){
        List<Account> listofaccount = new List<Account>();
        for(Integer i=0;i<200;i++){
            Account objAccount = new Account();
            objAccount.Name = 'TestName';
            objAccount.City__c = 'Pune';
            listofaccount.add(objaccount);
        }
        insert listofaccount;
    }
    
    @isTest static void Testmethod1(){
        AccountUpdateBatch objAccountUpdateBatch = new AccountUpdateBatch();
        Id batchId = database.executeBatch(objAccountUpdateBatch);
    }
}