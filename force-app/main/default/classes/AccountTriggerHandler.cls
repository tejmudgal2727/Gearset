public class AccountTriggerHandler {
    public static void beforeAccountDelete(List<Account> lstNewList){
        for(Account acc : lstNewList){
            if(acc.Active__c != NULL && acc.Active__c == 'Yes'){
                acc.addError('You can not delete active account.');
            }
        }
    }
}