public class mondayevening {
    
    public static List<Contact> multipleRecords()
    {
        List<Contact> newlist = new List<Contact>{new Contact(FirstName='Reshma',LastName='Kumbhar',Department='BCA'),
                                               new Contact(FirstName='Rohan',LastName='Sharma',Department='MCA'),
            new Contact(FirstName='Rama',LastName='Awsthi',Department='BCA')};
                
                insert newlist;
//return newlist;
        
        List<Contact> listtoupdate = new List<Contact>();
        
        for(Contact con : newlist)
        {
            if(con.Department =='BCA')
            {
                con.Title='Computer Science';
                listtoupdate.add(con);
            }
        }
        update listtoupdate;
        return listtoupdate;
    }
    
               
       
    

}