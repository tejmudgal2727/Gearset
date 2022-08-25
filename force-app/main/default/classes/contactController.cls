public class contactController {
	@AuraEnabled(cacheable = true)
    public static List<contact> getContactInformation(){
        return [SELECT Name,Email,Department FROM Contact];
    }
}