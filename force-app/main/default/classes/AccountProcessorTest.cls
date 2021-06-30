@isTest
public class AccountProcessorTest {
    @isTest static void createDate(){
        Account a = new Account();
        a.name='Me';
        a.Description='Hello me';
        insert a;
        
       Contact c = new Contact();
        c.LastName = 'Kamble';
        c.AccountId=a.id;
        insert c;
        
        Set<Id> AcctId = new Set<Id>();
        AcctId.add(a.Id);
        
        //Test.StartTest();
        
       AccountProcessor.countContacts(AcctId);
        
       // Test.StopTest();
        
    }
}