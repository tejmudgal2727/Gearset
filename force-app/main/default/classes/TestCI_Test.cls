@isTest(SeeAllData=False)
public class TestCI_Test {
	public static testMethod void testMyClass(){
       String helloMessage = TestCI.ParentMethod();

       System.assertEquals(helloMessage, 'Test Integration8');
    }
}