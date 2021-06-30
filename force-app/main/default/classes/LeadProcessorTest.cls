@isTest
public class LeadProcessorTest {
    @TestsetUp static void testdata(){
        List<Lead> Listoflead = new List<Lead>();
        for(Integer i=0;i<200;i++){
            Lead objLead = new Lead();
            objLead.LastName = 'TestLead';
            objLead.Company = 'others';
            objLead.MobilePhone='12345678';
            objLead.State = 'Open - Not Contacted';
            Listoflead.add(objLead);
        }
        insert Listoflead;
    }
    
    @isTest static void Test(){
       // Test.startTest();
        LeadProcessor objLeadProcessor = new LeadProcessor();
        Id batchId = database.executeBatch(objLeadProcessor);
        System.debug('Batch Id Contains : - '+batchId);
       // Test.StopTest();
    }
    
    //System.assertEquals(200, [select Count() from Lead where LeadSource = 'Dreamforce']);
    //System.assertEquals(200, [select count() from lead where LeadSource = 'Dreamforce']);
}