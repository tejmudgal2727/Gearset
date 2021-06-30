trigger tryonce on Contact (after insert,after update) {
Set<id> accIdList = new Set<id>();
  for(Contact con : Trigger.new){
    accIdList.add(con.accountid);
}
  List<Account> accUpdateList = new List<Account>();
  List<String> names = new List<String>();

  for(Account acc : [Select id, Cnames__c, (Select firstName,LastName From Contacts) From Account Where Id In : accIdList]){
    for(Contact con : acc.Contacts){
      if(con.LastName != null){
       names.add(con.FirstName);
      }
    }
      acc.Cnames__c = String.join(names, ', ');
    accUpdateList.add(acc);
  }    
  update accUpdateList;
}