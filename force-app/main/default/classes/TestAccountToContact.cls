@isTest
Private class TestAccountToContact {
    @TestSetUp static void CreateDataForTestClass(){
        Account a = new Account();
        a.Name ='Test';
        a.Description='New Test Class';
        a.Industry='Banking';
        insert a;
        
        Contact c = new Contact();
        c.LastName='fly';
        c.Description='Test Run';
        c.AccountId=a.Id;
        insert c;
    }
    
    @isTest static void TestMethod1(){
        Account acc = [select Id,Description,Industry from Account LIMIT 1];
        acc.Industry='Education';
        update acc;
        
        contact ct = [select Id,Description,AccountId from Contact where Id =:acc.Id Limit 1];
    }
}