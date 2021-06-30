public class LeadTiggerHandler {
    
    public static void TriggerHandler(List<Lead> listlead){
         for(Lead le : listlead){
    if(le.leadSource == 'Phone inquiry'){
    	le.Description = 'Phone inquiry';
    }
}
    }

}