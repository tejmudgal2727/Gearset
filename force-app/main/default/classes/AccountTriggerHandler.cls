public with sharing class AccountTriggerHandler {
   // Method Declaration...
    public static void CreateAccounts(List<Account> accRec){
        if(accRec.size()>0){
            for(Account acRec : accRec){
           		acRec.ShippingState = acRec.BillingState;
        }
      }
   }
}