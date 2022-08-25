public class Calculator {
	@auraEnabled(cacheable=true)
    public static Integer sum(Integer Number1 , Integer Number2){
        return (Number1+Number2);
    }
}