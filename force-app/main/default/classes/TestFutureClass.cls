@isTest
public class TestFutureClass {
    @TestSetUp static void CreateData(){
        lead le = new Lead();
        le.LastName='abc';
        le.Phone='12345678';
        le.Description='Future method';
        le.MobilePhone='2345';
        le.LeadSource='Closed-Converted';
        le.Company='tcs';
        insert le;
    }
        @isTest public static void Method(){
        //List<String> lle = new List<String>();
        lead le1 = [select Id,phone,Description from Lead Limit 1];
       // lle.add(le1);
        le1.phone='2345';
           // Test.StartTest();
        update le1;
           // Test.StopTest();
    }

}