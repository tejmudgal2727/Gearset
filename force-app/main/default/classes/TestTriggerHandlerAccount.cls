@isTest
public class TestTriggerHandlerAccount {
    @Testsetup static void CreateData(){
        Account a = new Account();
        a.Name='Trigger Handler';
        a.BillingCity='Pune';
        a.Industry='Banking';
        insert a;
        
        Contact con = new Contact();
        con.LastName = a.Name;
        con.AccountId = a.Id;
        insert con;
    }
    
 
    @istest static void Method2(){
        Account acc = [select Id, Name from Account LIMIT 1];
        acc.name ='trytest';
        update acc;
    }
}