public class LeadProcessor implements database.Batchable <sObject> {
    public database.QueryLocator start(database.BatchableContext bc){
        return database.getQueryLocator(
            [select Id,
            LeadSource,
            Fax from Lead]);
    }
    public void Execute(Database.BatchableContext bc , List<Lead> listofLead){
        //List<Lead> ListOfLeads = new List<Lead>();
        for(Lead objLead : listofLead){
            System.debug('objLead Contains :- '+objLead);
            objLead.LeadSource = 'Dreamforce';
            //ListofLeads.add(objLead);
        }
        update listoflead;
    }
    public void finish(database.BatchableContext bc){
        
    }
}