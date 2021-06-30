// If Contract is Updated then put Name of the Contract into Account Description.

trigger ContractToAccount on Contract (after update) {
    
    Map<Id,Contract> mapCont = new Map<Id,Contract>();
    List<Account> listacc = new List<Account>();
    List<Account> listacc2 = new List<Account>();
    
    if(trigger.isExecuting && trigger.isAfter && trigger.isUpdate){
        for(Contract cont : trigger.new){
            if(cont<>trigger.oldmap.get(cont.Id)){
                mapCont.put(cont.AccountId , cont);
            }
            if(mapCont.size()>0){
                Account ac = [select Id,Name,Description from Account where Id =:mapCont.keySet()];
                listacc.add(ac);
            }
            if(listacc.size()>0){
                for(account acc1 : listacc){
                    acc1.Description = mapCont.get(acc1.Id).Name;
                    listacc2.add(acc1);
                    
                }
            }
        }
        
        if(listacc2.size()>0){
            update listacc2;
        }
    }

}