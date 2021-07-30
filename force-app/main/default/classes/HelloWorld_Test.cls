@isTest(SeeAllData=False)
public class HelloWorld_Test {
    public static testMethod void testMyClass(){
        String helloMessage = HelloWorld.helloMessage();
        System.assertEquals(helloMessage, 'Hello World1');
    }
}