public class OlderAccountsUtility {
    
    public static void updateOlderAccounts()
    {
        Account[] oldAccounts = [Select Id ,Description from Account ORDER BY CreatedDate Asc LIMIT 5 ];
        
        for(Account acct : oldAccounts)
        {
            acct.Description = 'Heritage Account';
        }
        
        update oldAccounts;
        
    }
    
    

}