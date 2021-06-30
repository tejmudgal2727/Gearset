public class deleteoperation {
    
    public static void del()
    {
        Contact[] condelete = [select Id from Contact where LastName='Shain'];
        delete condelete;
        System.debug('Contact deleted');
    }

}