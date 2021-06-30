public class ExampleSaturday {
    
    public static void ExSat()
    {
        try
        {
            Account acct = new Account();
            insert acct;
        }
        
        catch(DmlException e)
        {
            System.debug('DML Exception is Occured in Catch Block'+e.getMessage());
        }
    }

}