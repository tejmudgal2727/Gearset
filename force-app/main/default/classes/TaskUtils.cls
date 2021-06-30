public class TaskUtils { 
    
    public static String getTaskpropiority(String leadState)
    {
        if(String.isBlank(leadState) || leadState.length() > 2){
            return null;
        }
    
    String taskPriority;
    
    if(leadState=='CA')
    {
        taskPriority = 'High';
    }
    else
    {
        taskPriority = 'Normal';
    }
        
        Return taskPriority;
    }
    
}