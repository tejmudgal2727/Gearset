public class TriggerHandlerContact {
    public static void ContactMethod(set<Id> cont){
        
        List<Account> listAcc = new List<Account>();
        List<Contact> listCon = new List<Contact>();
        
        listAcc = [select Id,Name,Number_Of_Contacts__c from Account Where Id IN:cont];
        System.debug('listAcc Contains :- '+listAcc);
        listCon = [select Id,LastName,AccountId From Contact where AccountId IN:cont];
        system.debug('listcon contains :- '+listcon);
        
        List<Account> aclist = new List<Account>();
        for(Account a : listAcc){
            a.Number_Of_Contacts__c = listCon.size();
            aclist.add(a);
        }
        update aclist;
    }
}