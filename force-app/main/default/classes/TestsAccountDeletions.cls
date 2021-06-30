@isTest(SeeAllData=false)
private class TestsAccountDeletions {

    @isTest static void TestDeleteAccountWithOneOpportunity(){
        Account acc = new Account(Name='Test Account',AccountNumber='12345678');
        insert acc;
        
        Opportunity  opp = new Opportunity(Name=acc.Name,StageName='Prospecting',AccountId = acc.Id,CloseDate=System.today().addMonths(1));
                // Test data setup
        // Create one account with one opportunity by calling a utility method
        Account[] accts = TestDataFactory.createAccountsWithOpps(1,1);
        insert opp;
    }
}