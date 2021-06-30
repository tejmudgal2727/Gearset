@isTest
public class AddPrimaryContactTest {
    @isTest static void setup(){
        List<Account> listAccount = new List<Account>();
        for(Integer i=0;i<50;i++){
            listAccount.add(new Account(BillingState='CA',name='Test'+i));
        }
        for(Integer j=0;j<50;j++){
            listAccount.add(new Account(BillingState='NY',name='Test'+j));
        }
        insert listAccount;
        
        Contact co = new Contact();
        co.FirstName='Test';
        co.LastName='Method';
        insert co;
        
        String State='CA';
        AddPrimaryContact apc = new AddPrimaryContact(co,State);
        System.enqueueJob(apc);
    }
}