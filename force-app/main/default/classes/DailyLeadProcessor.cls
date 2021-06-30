Global class DailyLeadProcessor implements Schedulable  {
    global static void Execute(SchedulableContext ctx){
        List<Lead> leads = [select Id,LeadSource from Lead where LeadSource=NULL LIMIT 200];
        List<Lead> updatedlist = new List<Lead>();
        if(!leads.isEmpty()){
            for(Lead le : leads){
                le.Leadsource = 'DreamForce';
                updatedlist.add(le);
            }
            update updatedlist;
        }
    }
}