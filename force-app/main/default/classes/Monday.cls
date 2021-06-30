public class Monday {
    
    public static void MondayMorning()
    {
        try
        {
            Account acct = new Account(Name ='Rohan',Phone='982342271');
            insert acct;
            System.debug('Record Inserted..');
        }
        
        catch(DmlException e)
        {
            System.debug('Exception Occured'+e.getMessage());
        }
    }

}