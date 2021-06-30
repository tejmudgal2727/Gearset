// Whenever New Account Record is created then needs to create associated Contact Record automatically.
trigger ContactRecordCreated on Account (after insert) {
    List<Contact> Conlist = new List<Contact>();
    for(Account acc : Trigger.New){
        Contact con = new Contact();
        con.LastName = acc.Name;
        con.AccountId = acc.Id;
        con.Fax = '100';
        conlist.add(con);
    }
    insert conlist;
}