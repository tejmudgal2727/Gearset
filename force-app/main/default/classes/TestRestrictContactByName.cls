@isTest(SeeAllData=false)
public class TestRestrictContactByName {

    @isTest public static void TestMethod1(){
        Contact con = new Contact();
        con.LastName='INVALIDNAME';
        insert con;
        
        System.assertEquals('Dhanger',  con.LastName);
    }
}