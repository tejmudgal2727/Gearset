trigger onAccountTrigger on Account (After update) {
    map<Id,Account> mapAcc = new map<Id,Account>();
    List<Contact> conList = new List<Contact>();
     List<Contact> conList1 = new List<Contact>();
    if(trigger.isExecuting && trigger.isAfter && trigger.isupdate){
        for(Account ac : Trigger.new){
            if(ac.Industry<>trigger.oldmap.get(Ac.Id).Industry){
                mapAcc.put(ac.Id,ac);
            }
            if(mapAcc.size()>0){
                conList = [select Id,Description,AccountId from Contact where AccountId =:mapAcc.keyset()];
            }
            if(conList.size()>0){
                for(Contact c : conList){
                    c.Description = mapAcc.get(c.AccountId).Industry;
                    conList1.add(c);
                }
            }
        }
        update conList1;
    }
}