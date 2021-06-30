public class NewContactList {
    
    public static void listcontact()
    {
    List<Contact> conlist = new List<Contact>{
        new Contact(FirstName='Joe',LastName='Smith',Department='Finance'),
        new Contact(FirstName='kim',LastName='Shain',Department='Education')};
            
 insert conlist;
    
    List<Contact> listtoupdate = new List<Contact>();
    
    for(Contact con : conlist)
    {
        if(con.Department == 'Finance')
        {
            con.Title = 'Finance Analyst';
              listtoupdate.add(con);
        }
  
}
    
   update listtoupdate;
    }
}