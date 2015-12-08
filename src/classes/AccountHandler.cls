public class AccountHandler {
    public static Account insertNewAccount(String n){
		Account acct = new Account();
        acct.Name = n;
        try{
            insert acct;
            return acct;
        }catch(DmlException e){
            return null;
        }
    }
}