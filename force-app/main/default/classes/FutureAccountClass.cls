public class FutureAccountClass {
    @Future
    public static void FutureMethod(List<String> accMap){
        List<Account> listAc = new List<Account>();
        List<Account> updateAc = new List<Account>();
        if(accMap.size()>0){
        listAc = [select Id,Name,Status__c from Account where Id IN:accMap];
        }
        if(listAc.size()>0){
            for(Account a : listAc){
                a.Status__c = 'Open';
                updateAc.add(a);
            }
            update updateAc;
            
        }
    }
}