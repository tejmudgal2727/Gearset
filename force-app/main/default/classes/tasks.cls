public class tasks {

    public static String Taskmethod(String landstate){
        if(string.isBlank(landstate) || landstate.length()>2){
            return null;
            
        }
        string taskPriority;
        if(landstate=='CA'){
            taskPriority = 'High';
            System.debug('TaskPriority '+taskPriority);
        }
        else{
                taskPriority='Normal';
            System.debug('TaskPriority : '+taskPriority);
        }
        return taskPriority;
    }
}