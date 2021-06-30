public class NewinsertRecords {

    public static List<Contact> NewContact()
    {
        List<Contact> conList =new List<Contact> {
            new Contact (Firstname='Brian', 
                         Lastname='Dent', 
                         Phone='(619)852-4569',
                         Department='Mission Control', 
                         Title='Mission Specialist - Neptune', 
                         Email='briandent@trailhead.com')
                };
                           
                           insert conList;
        return conList;
    }
    
}