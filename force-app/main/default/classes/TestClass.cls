public class TestClass {
	
    public  void TestMethods(){
        Map<String,String> mapofValue = new Map<String,String>();
        mapofValue.put('1','Tejas');
        mapofValue.put('2','omkar');
        mapofValue.put('1','prashant');
         System.debug('Map -->> '+mapofValue);
     }
    public void demo(){
	Map<Id,Account> mapofAccount = new Map<Id,Account>();
    List<Account> accList = new List<Account>();
        accList = [SELECT Id,Name from Account];
        for(Account a : accList){
            mapofAccount.put(a.id,a);
        }
        
        System.debug('accList -->> '+accList);
       // System.debug('For -->> '+ for(Account a : accList));
        System.debug('mapofAccount -->>'+mapofAccount);
       // return accList;
    }
}