@isTest
public class NewBatchClassTest {
    @Testsetup static void TestData(){
        List<Contact> listofcontact  = new List<Contact>();
        for(Integer i=0;i<200;i++){
            Contact objcontact = new Contact();
            objcontact.FirstName = 'TestclassData';
            objcontact.LastName='create';
            objcontact.LeadSource = 'web';
            listofcontact.add(objcontact);
        }
        insert listofcontact;
    }
    
    @isTest static void Method(){
        NewBatchclass objNewBatchClass = new NewBatchClass();
        Id batchId =  Database.executeBatch(objNewBatchClass);
    }
}