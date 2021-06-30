// Create an Queueable Apex class that inserts Contacts  for Accounts.
public class AddPrimaryContact implements Queueable{
	Private Contact contacts;
    Private string state;
    
    // Call constructor 
    public AddPrimaryContact(Contact c , String state){
        this.contacts = c;
        this.state = state;
    }
    // Call Execute method AddPrimaryContactTest
    public void Execute(Queueablecontext qc){
        // Performaing Query on Account Record 
     List<Account> listAccount = [select Id,Name,Billingstate,(select Id,firstname,lastname from contacts) from Account where Billingstate=:state Limit 200];
        List<Contact> listContact = new List<Contact>();
        for(Account Acc : listAccount){
            Contact cont = Contacts.clone(false,false,false,false);
            cont.AccountId = acc.Id;
            listContact.add(cont);
        }
        if(listContact.size()>0){
            insert listContact;
        }
    }
}