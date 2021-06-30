public class Queueableclass implements Queueable {
    public static void Execute(QueueableContext QC){
        Account acc = new Account();
        acc.name = 'I am in solapur';
        insert acc;
    }
}