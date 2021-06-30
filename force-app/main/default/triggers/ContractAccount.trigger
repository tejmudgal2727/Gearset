//If the Contract is Updated in the description of the Account put Contract name

trigger ContractAccount on Contract (after Update) {
    
    Map<Id,Contract> Mapco = new Map<Id,Contract>();
    List<Account> AcList = new List<Account>();
    List<Account> AcList1 = new List<Account>();
    if(trigger.isExecuting && trigger.isAfter && trigger.isUpdate){
        try{
        for(Contract cont : trigger.new){
            if(cont<>trigger.oldmap.get(cont.Id)){
                Mapco.put(cont.AccountId,cont);
            }
            if(Mapco.size()>0){
                AcList = [select Id,name,Description from Account where Id =:Mapco.keySet()];
            }
            if(AcList.size()>0){
                for(Account acc : AcList){
                    acc.Description = Mapco.get(acc.Id).Name;
                    System.debug('Account Description contain : '+acc.Description);
                    System.debug('MapCo Contain : '+Mapco);
                    AcList1.add(acc);
                }
            }
        }
            if(AcList1.size()>0){
                update AcList1;
            }
        }
        Catch(Exception ex){
            System.debug('Get Error '+ex.getMessage());
        }
    }

}