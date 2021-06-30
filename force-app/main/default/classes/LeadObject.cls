// lead Description is updated in future method when the phone is updated
public class LeadObject {
    @future
    public static void FutureMethod(List<String> ListId){
        List<Lead> l1 = new List<Lead>();
        List<Lead> l2 = new List<Lead>();
        Lead l = [select Id,Description,phone from lead where Id =: ListId];
        l1.add(l);
    
    if(l1.size()>0){
        for(Lead le : l1){
        le.Description = ' Updated by future';
        l2.add(le);
        }
        update l2;
    }
}
}