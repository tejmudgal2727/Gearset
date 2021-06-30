public class RandomContactFactory {

    public static List<Contact> generateRandomContacts(Integer NumofContact , string namelast){
        List<Contact> conlist = new List<Contact>();
        
        for(Integer i=0;i<NumofContact;i++){
            contact cont = new Contact(FirstName='Test'+i,LastName=namelast);
            
            conlist.add(cont);
        }
        return conlist;
    }
}