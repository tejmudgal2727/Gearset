public class BankAcct  {
    
    Private Integer balance=0;
    public String acctName;
    public String acctType;
    
    public Void makeDeposit(Integer Deposit)
    {
        balance = balance + Deposit;
        
    }
    
    public Integer getBalance()
    {
        return balance;
    }

}