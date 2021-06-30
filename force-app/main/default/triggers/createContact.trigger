/* 
 1.Create related contact when Account is created.
 2.Object Used - Account nd Contact
 3.trigger on - Account 
 4.Event - After
 5.DML - Insert
 6.Author - Tejas Mudgal
*/ 

trigger createContact on Account (After insert) {
    if(Trigger.isExecuting && Trigger.isAfter && Trigger.isInsert){
      List<Contact> listOfContactRecord = new List<Contact>();
        for(Account accountRecord : trigger.new){
            Contact contInstance = new Contact();
            contInstance.FirstName = 'Deepish';
            contInstance.LastName = 'Adwani';
            contInstance.AccountId = accountRecord.Id;
            listOfContactRecord.add(contInstance);
        }
        System.debug('listOfContactRecord -->> '+listOfContactRecord);
        if(listOfContactRecord.size()>0){
            insert listOfContactRecord;
        }
    }
}