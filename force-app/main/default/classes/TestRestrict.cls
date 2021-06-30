@isTest(seeAllData=false)
public class TestRestrict {

    @isTest public static void TestRe(){
        Contact con = new Contact();
        con.LastName = 'INVALIDNAME';
        try{
        insert con;
        }
        
        catch (Exception ex){
            system.debug(ex.getMessage());
            System.assertEquals(true, ex.getMessage().contains('The Last Name "'+con.LastName+'" is not allowed for DML'));
            
        }
    }
}