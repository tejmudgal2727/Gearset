@isTest
Private class tasksTest {
    @isTest static void tasksTestMethod(){
        String pri = tasks.Taskmethod('NY');
        System.assertEquals('Normal', Pri);
    }
    @isTest static void tasksTestMethod1(){
        String pri = tasks.Taskmethod('CA');
        System.assertEquals('High', Pri);
}
    @isTest static void tasksTestMethod2(){
        String pri = tasks.Taskmethod('Pune');
        System.assertEquals(null, Pri);
}
}