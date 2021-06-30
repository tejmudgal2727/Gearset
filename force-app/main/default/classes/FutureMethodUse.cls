public class FutureMethodUse {
    @future 
    public static void somefuturemethod(List<Id> listid){
        List<Lead> l1 = new List<Lead>();
        List<Lead> l2 = new List<Lead>();
        Lead le = [select Id,Phone,Description from Lead where Id =:listid];
        l1.add(le);
        
        if(l1.size()>0){
            for(Lead lf : l1){
                lf.Description = 'Updated by future method';
                l2.add(lf);
            }
        }
        update l2;
    }
}