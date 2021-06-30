@isTest
Private class AccountTriggerTest {
    @isTest static void TestCreateNewAccountInBulk(){
        List<Account> acc = new List<Account>();
        for(Integer i=0;i<200;i++){
            Account ac = new Account(Name='Test_Account'+i , BillingState='CA');
            acc.add(ac);
        }
        Test.startTest();
        insert acc;
        Test.stopTest();
        
        List<Account> verifyAccount = [SELECT Id,ShippingState FROM Account where ShippingState='CA'];
            System.assertEquals(200,verifyAccount.size());
    }
}