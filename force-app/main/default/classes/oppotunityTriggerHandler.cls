public class oppotunityTriggerHandler {
    public static void oppMethod(Map<Id,opportunity> mapOpp){
        List<Account> accList = new List<Account>();
        List<opportunity> oppList = new List<opportunity>();
        List<Account> listAcc = new List<Account>();
        if(mapOpp.size()>0){
           accList = [select Id,Name,Number_Of_Oppotunities__c from Account where Id =: mapOpp.keyset()];
           oppList = [select Id,Name,AccountId from opportunity where AccountId =: mapOpp.keySet()];
        }
        if(accList.size()>0){
            for(Account a : accList){
                a.Number_Of_Oppotunities__c = oppList.size();
                listAcc.add(a);
            }
            update listAcc;
        }
    }
}