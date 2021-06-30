public class ContactTriggerHandler {

  public static void contactHandler(List<Contact> listcon){
        
        for(Contact con : listcon){
    
    if(con.Email != NULL && con.Phone !=NULL){
    
    con.Department = 'Finance';
     }
}
  }
    
    
    public static void ContactHandler1(List<Contact> listcont){
        for(Contact cont : listcont){
            if(	cont.LeadSource == 'Web'){
                cont.Fax='100';
            }
        }
    }
}