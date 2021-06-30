public class NewAccounts {

    public static void sObjectsInsert(Integer value)
    {
        Integer counter =1;
        List<Account> teafactoryaccount = new List<Account>();
        
        while(counter<=value)
        {
            
            System.debug('Counter value before incrementing - '+counter);
            
        Account store = new Account();
        store.Name = 'The Tea Factory';
        store.AccountNumber='356281';
        store.Phone='555-0158';
           teafactoryaccount.add(store);
            System.debug(store);
            counter = counter + 1;
        }
        
        System.debug('The Size of List - '+teafactoryaccount.size());
        System.debug('Counter Value after increment - '+counter);
        
        insert teafactoryaccount;
        
        
    }
}