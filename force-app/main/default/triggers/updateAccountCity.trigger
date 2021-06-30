trigger updateAccountCity on Contact (After Update) {
	Map<Id,Contact> mapContact = new Map<Id,Contact>();
    List<Account> accList = new List<Account>();
    List<Account> updateAccList = new List<Account>();
    for(Contact objContact : Trigger.new){
        if(objContact.LeadSource <> Trigger.oldMap.get(objContact.Id).LeadSource){
            mapContact.put(objContact.AccountId,objContact);
        }
    }
    System.debug('mapContact-->>'+mapContact);
    if(!mapContact.isEmpty()){
        accList = [SELECT Id,City__c FROM Account WHERE Id =:mapContact.keySet()];
        System.debug('accList -->>'+accList);
    }
    if(accList.size()>0){
        for(Account ac : accList){
            ac.City__c = mapContact.get(ac.Id).LeadSource;
            updateAccList.add(ac);
        }
        if(updateAccList.size()>0){
            update updateAccList;
        }
	}
}