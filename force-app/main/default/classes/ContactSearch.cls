public class ContactSearch {

    public static List<Contact> searchForContacts(String lastName,String PostalCode)
    {
        List<Contact> ConList = [select Id,Name from Contact where LastName=:lastName AND MailingPostalCode=:PostalCode];
        
        //System.debug(ID)
        return ConList;
    }
}