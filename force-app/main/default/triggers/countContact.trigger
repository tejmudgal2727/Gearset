trigger countContact on Contact (After insert) {
	Set<Id> setAccountId = new Set<Id>();
    List<Account> acList = new List<Account>();
    List<Account> updateacList = new List<Account>();
    for(Contact objcontact : Trigger.new){
        setAccountId.add(objcontact.AccountId);
    }
    System.debug('setAccountId -->> '+SetAccountId);
    if(!setAccountId.isEmpty()){
        acList = [SELECT Id,Number_Of_Contacts__c,(SELECT Id FROM Contacts) FROM Account WHERE Id=:setAccountId];
        System.debug('acList-->>'+acList);
    }
    if(acList.size()>0){
        for(Account ac : acList){
            ac.Number_Of_Contacts__c = ac.contacts.size();
            updateacList.add(ac);
        }
        System.debug('updateacList-->>'+updateacList);
    }
    update updateacList;
 }