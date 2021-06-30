public class contactRecords {

    public static List<Contact> NewRecord(Integer Value)
    {

        List<Contact> newlist = new List<Contact>();
        
        Integer Counter=1;
        
        while(Counter <= Value)
        {

            Contact c = new Contact();
            c.LastName = 'reyansh';
            c.Department='account';
            c.LastName='Rama ';
            c.Department='finace';
            
            counter = counter + 1;
            
            newlist.add(c);
        
        
        
        
        }
    
    insert newlist;
    //return newlist;
        
        
        List<Contact> newlist1 = new List<Contact>();
        
        for(Contact con : newlist)
        {
            
            if(con.Department == 'Account')
            {
                con.department = 'Education';
                newlist1.add(con);
            }
            
        }
        
        update newlist1;
        
        return newlist1;
    }
}