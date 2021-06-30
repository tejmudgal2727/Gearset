public class AccountProcessor {
    @future
    public static void countContacts(Set<Id> listId){
      List<Account> AccountCount = [select Id,Number_Of_Contacts__c,(select Id from Contacts) from Account where id =:listid];
        if(AccountCount.size()>0){
            for(Account a : AccountCount){
                a.Number_Of_Contacts__c = a.Contacts.size();
            }
             update AccountCount;
        }
       
    }
}