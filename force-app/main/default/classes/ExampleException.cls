public class ExampleException extends Exception {
    
    public static Void ExEp()
    {
        try
        {
            Account acct = new Account(Name='showik',Phone='555-12345');
            insert acct;
            System.debug('Record Inserted Successfully');
            
            Id acctId = acct.Id;
            System.debug('Id :'+acctId);
            
            Account[] acdel = [select id from Account where Name='showik'];
            delete acdel;
            System.debug('Record is deleted');
        }
        
        catch(DmlException e)
        {
            System.debug('A DML Exception Occured :'+e.getMessage());
        }
    }

}