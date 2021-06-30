public class ContactUtility {

    public static void viewContacts()
    {
        List<Contact> listofContact = [Select FirstName,LastName from Contact ORDER BY Name ASC LIMIT 5];
        
        for(Contact con : listofContact)
        {
          String fullName = 'FirstName: ' +con.FirstName+ ', LastName: '+con.LastName;
            System.debug(fullName);
        }
    }
}