@isTest
private class TestContactToAccount {
    @TestSetUp static void CreateTestData(){
        Account a = new Account();
        a.Name='Test Account';
        a.Description='fly';
        a.type='cash';
        insert a;
        
        Contact c = new Contact();
        c.LastName='Human';
        c.AccountId=a.Id;
        c.Salutation='Mr';
        insert c;
    }
    
    @isTest static void Methods(){
        Contact ct = [Select Id,Salutation,LastName from Contact];
        ct.Salutation='Dr';
        update ct;
    }
}