trigger CountAssociatedcontact on Contact (after insert) {
    if(Trigger.isExecuting && Trigger.isAfter && Trigger.isInsert){
        Set<Id> setCon = new set<Id>();
        List<account> aclist = new List<Account>();
        for(Contact con : Trigger.new){
            setCon.add(con.AccountId);
        }
        List<Account> acc = [select Id,Number_Of_Contacts__c from Account where Id =: setcon];
        List<Contact> con = [select Id,Lastname from contact where accountId =: setcon];
        
        for(Account a : acc){
            a.Number_Of_Contacts__c = con.size();
            aclist.add(a);
        }
        update aclist;
        }
    }