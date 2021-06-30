@isTest
Private class TestVerifyDate {

    @isTest static void testCheckDates(){
        Date returndate1 = VerifyDate.CheckDates(Date.valueOf('2020-2-2'),Date.valueOf('2020-3-10'));
        system.assertEquals(Date.valueOf('2020-2-2'), returndate1);
    }
    @isTest static void testDateWithin30Days(){
        Date returndate2 =  VerifyDate.CheckDates(Date.valueOf('2020-2-14'),Date.valueOf('2020-3-24'));
        system.assertEquals(Date.valueOf('2020-2-29'), returndate2);
     }
}