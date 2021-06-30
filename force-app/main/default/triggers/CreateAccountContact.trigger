// Whenever the Account is created with Industry as Banking then create a contact for account, Contact Lastname as Account name and contact phone as account phone
trigger CreateAccountContact on Account (after insert) {
    List<Contact> conlist = new List<Contact>();
    for(Account acc : Trigger.New){
        if(acc.Industry == 'Banking'){
            Contact con = new Contact();
            con.LastName = Acc.Name;
            Con.Phone = Acc.Phone;
            con.AccountId = acc.Id;
            conlist.add(con);
        }
        insert conlist;
    }
}