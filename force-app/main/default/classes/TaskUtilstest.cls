@isTest

private class TaskUtilstest {
    
    @isTest static void testTaskPriority()
        {
           String pri = TaskUtils.getTaskpropiority('NY');
            System.assertEquals('Normal',pri);
        }
    
    @isTest static void testTaskHighPriority()
    {
        String pri = TaskUtils.getTaskpropiority('CA');
        System.assertEquals('High',pri);
    }
    
    @isTest static void testTaskPriorityInvalid()
    {
        String pri = TaskUtils.getTaskpropiority('Motana');
        System.assertEquals(null,pri);
    }

}