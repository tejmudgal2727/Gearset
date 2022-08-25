public without sharing class accountController {
	@AuraEnabled(cacheable=true)
    public static List<Account> getAccountRecords(){
        return [SELECT Name,AnnualRevenue,Industry FROM Account];
	}
}