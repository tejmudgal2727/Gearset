@isTest(SeeAllData=False)

public class FirstTestClass {

    @TestSetUp static void CreateTestData(){
        
        Account ac = new Account();
        ac.Name='NewTestClassData';
        ac.Description='NewClassData';
        ac.Industry='Banking';
        ac.AccountNumber='12345678';
        insert ac;
        
        Contact ct = new Contact();
        ct.LastName='NewContactData';
        ct.Description='ContactNewDescription';
        ct.AccountId=ac.Id;
        insert ct;
    }
    
    @isTest static void TestMethod1(){
        
        Account acc = [select Id,Industry from Account LIMIT 1];
        acc.Industry='Energy';
        update acc;
       // System.assertEquals('Banking', acc.Industry);
        
        Contact ctn = [select Id,LastName,Description,Account.Id from contact where Account.Id =:acc.Id LIMIT 1];
        System.assertEquals(ctn.Description, acc.Industry);
    }
}