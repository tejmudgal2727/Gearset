@isTest
Private class TestAddPrefix {

    @isTest static void Method(){
        Account a = new Account(Name='Deepak');
        //a.Name = 'Deepak';
        a.Name = 'Mr.'+a.Name;
        insert a;
    }
}