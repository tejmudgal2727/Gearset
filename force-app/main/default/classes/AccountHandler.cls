public with sharing class AccountHandler {
    public static void createdata(List<Account> acct){
        List<Opportunity> listoop = new List<opportunity>();
        for(Account a : acct){
            Opportunity opp = new Opportunity();
            opp.name = a.Name + 'opportunity';
            opp.AccountId = a.Id;
            opp.StageName ='Prospecting';
            opp.CloseDate = System.today().addMonths(1);
            listoop.add(opp);
        }
        insert listoop;
   }
}