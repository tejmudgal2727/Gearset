public class AccountUtils {
    // Method Declaration...
	public static List<Account> accountsByState(String States){
        List<Account> accList =  [SELECT Id,Name FROM Account Where BillingState =: States];
       	//System.debug(' accList -->> '+accList);
        return accList;
    }
}