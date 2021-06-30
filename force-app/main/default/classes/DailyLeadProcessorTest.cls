@isTest
public class DailyLeadProcessorTest {
    @testsetup static void testdata(){
        List<Lead> listLead = new List<Lead>();
        for(Integer i=0;i<200;i++){
            Lead l = new Lead(lastname='testln',Company='xyz'+i , Title='LeadTestClass'+i);
            listLead.add(l);
        }
        insert listLead;
    }
   public static testmethod void schTest(){
    Test.startTest();
        
        String sch = '0 0 12 * * ?';
       // DailyLeadProcessor 
        DailyLeadProcessor.execute(null);
      //  String jobId = System.schedule('ScheduleJobApex', sch, new DailyLeadProcessor());
       // DailyLeadProcessor
        List<Lead> listResult = [select Id from Lead where LeadSource='DreamForce'];
       Test.stopTest();
                System.assertEquals(200, listResult.size());

    }
}