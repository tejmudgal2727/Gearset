public class ContactAndLeadSearch {
    
    public static List<List<sObject>> searchContactsAndLeads(String Searchtext)
    {
        List<List<sObject>> searchlist = [find :Searchtext in all fields returning Contact(FirstName,LastName),Lead(FirstName,LastName)];
        
        Contact[] searchContact = (Contact[])searchlist[0];
        Lead[] searchLead = (Lead[])searchlist[1];
       
        System.debug('Found following Contacts');
        for(Contact c : searchContact)
        {
            System.debug(c.FirstName +', '+c.LastName);
        }
        
        System.debug('Found Following Leads');
        for(Lead l : searchLead)
        {
            System.debug(l.FirstName+', '+l.LastName);
        }
        
        return searchlist;
    }

}