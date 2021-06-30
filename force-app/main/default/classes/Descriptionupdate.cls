public class Descriptionupdate implements database.batchable<sobject>,database.Stateful {
    public set<Id> AllId = new Set<Id>();
    public set<Id> AllFailId = new set<Id>();
    public List<Id> AllsuccessId = new List<Id>();
    public Integer recordprocessed=0;
    public Integer countsuccessrecord = 0;
    public Integer unupdatedcount = 0;
    
    public database.querylocator start(database.BatchableContext bc){
        return database.getQueryLocator([select Id,Name,BillingCity,Description from Account where BillingCity='Pune']);
    }
    public void Execute(database.BatchableContext bc , List<Account> listofAccount){
        List<Account> AccountList = new List<Account>();
       for(Account objAccount : listofAccount){
            objAccount.Description = 'Descriptions Updated through batch class27';
            AllId.add(objAccount.Id);
           AccountList.add(objAccount);
           System.debug('objAccount Contains :- '+objAccount);
           recordprocessed = recordprocessed + 1;
        }
        Database.SaveResult[] myresult = database.update(listofAccount,false);
        for(Integer i=0;i< myresult.size();i++){
            if(myresult.get(i).isSuccess()){
             system.debug('All Records are updated successfully');
               AllsuccessId.add(myresult.get(i).Id);
                countsuccessrecord = countsuccessrecord+1;
            }
            else if(!myresult.get(i).issuccess()){
                system.debug('Failure Record Ids While Updating :- '+listofAccount);
                AllFailId.add(listofAccount.get(i).Id);
                unupdatedcount = unupdatedcount + 1;
            }
        }
        
   }
    Public void Finish(Database.BatchableContext bc){
        System.debug('Record Processed :- '+recordprocessed);
        system.debug('All fails Ids===> ' +allFailId);
        System.debug('All Success Ids ==> '+allsuccessId);
        system.debug('Success Count :- '+countsuccessrecord);
        System.debug('unsuccess count :- '+unupdatedcount);
        
        Messaging.SingleEmailMessage mail = new messaging.SingleEmailMessage();
        String[] toaddresses = new String[]{'tejmudgal2727@gmail.com'};
        mail.setToAddresses(toaddresses);
        mail.setsubject('Batch Apex job is done');
        mail.setPlainTextBody('Hi Prashant, '+'Total'+' ' + unupdatedcount +'  '+'Records Are not updated through Batch Class'+' '+ 'The Ids of Failed Record '+' '+ allFailId);
        Messaging.sendEmail(new Messaging.SingleEmailMessage[]{mail});
        
    }
}