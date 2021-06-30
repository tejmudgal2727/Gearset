public class Addones {
    
    public static void AddRecord()
    {
        Contact con = new Contact(FirstName='Tushar',LastName='Mudgal',Department='Marketing');
            insert con;
        System.debug('Contact/Record Inserted');
        
    }

}