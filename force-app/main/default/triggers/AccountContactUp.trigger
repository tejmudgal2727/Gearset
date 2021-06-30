// If The Account Industry is updated then put same in the contact Description.

trigger AccountContactUp on Account (after update) {
    
    /*Map<Id,Account> mapAcc = new Map<Id,Account>();
    List<Contact> conlist = new List<Contact>();
    List<Contact> conlist1 = new List<Contact>();
    
    if(trigger.isExecuting && trigger.isAfter &&  trigger.isUpdate){
        try{
            for(Account ac : trigger.new){
                if(ac.Industry<>trigger.oldMap.get(ac.Id).Industry){
                    mapAcc.put(ac.Id,ac);
                }
                if(mapAcc.size()>0){
                    conlist = [select Id , Description,AccountId from contact where AccountId =:mapAcc.keySet()];
                }
                if(conlist.size()>0){
                    for(Contact con :conlist){
                        con.Description = mapAcc.get(con.AccountId).Industry;
                        conlist1.add(con);
                    }
                }
            }
            insert conlist1;
            update conlist1;
        }
        catch(Exception ex){
            system.debug('Error Occur : '+ex.getMessage());
        }
    }*/

}