public class ContactSearch {
    public static List<Contact> searchForContacts(String lastName, String zip){
        List<Contact> conList = 
            [SELECT Name FROM Contact WHERE LastName=:lastName AND  MailingPostalCode=:zip];
        return conList;
    }
  
}