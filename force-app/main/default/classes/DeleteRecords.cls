public class DeleteRecords {
    
    public static void DelRecord()
    {
        Contact[] con = [Select Id from Contact where LastName='Desai'];
        delete con;
        System.debug('Record Deleted');
    }

}