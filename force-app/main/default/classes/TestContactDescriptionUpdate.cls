@isTest
public class TestContactDescriptionUpdate {
    //
    @testsetup Static void setmethod(){
        Account ac = new Account();
        ac.Name='test data';
        ac.Industry = 'Banking';
        
        insert ac;
        
        Contact con = new Contact();
        con.LastName = 'Cntact test data';
        con.Description = 'yes test data';
        insert con;
    }
    @isTest Static void Methods(){
        List<Account> aclist = [select Id,Name,Industry from Account];
        for(Account acc : aclist){
            acc.Industry='Finance';
        }
        update aclist;
    }
}