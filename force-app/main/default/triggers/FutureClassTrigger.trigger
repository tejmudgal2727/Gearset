trigger FutureClassTrigger on Account (before update) {
    List<String> mapAcc = new List<String>();
    if(Trigger.isExecuting && Trigger.isBefore && Trigger.isUpdate){
        for(Account acc : Trigger.New){
            if(acc.Type <> Trigger.oldmap.get(acc.Id).Type){
                mapAcc.add(acc.Id);
            }
            if(mapAcc.size()>0){
                FutureAccountClass.FutureMethod(mapAcc);
            }
        }
    }
}