/*
 1. Update Account Rating to 'Hot' on account when opportunity stage equals 'closed Won'
 2. Object Used - Account and Opportunity
 3. Event - After 
 4. DML - update
 5. Trigger on - Opportunity 
 6. Author - Tejas Mudgal
 */


trigger updateAccountRating on Opportunity (After Update) {

    Set<Id> accountIds = new Set<Id>();
    List<Account> acList = new List<Account>();
    List<Account> accountList = new List<Account>();
    for(Opportunity oppRec : Trigger.new){
        if(oppRec.stageName == 'Closed Won'){
            accountIds.add(oppRec.AccountId);
        }
        System.debug('AccountIds -->> '+accountIds);
        System.debug('OppRec.AccountId -->>'+oppRec.AccountId);
    }
    if(accountIds.size()>0){
       accountList = [select Id,Rating from Account where Id =: accountIds];
        System.debug('AccountList -->> '+accountList);
    }
    if(accountList.size()>0){
        for(Account ac : accountList){
            ac.Rating = 'Hot';
            acList.add(ac);
        }
        if(acList.size()>0){
             update acList;
        }
       
    }
}