public class ContactAndLeadSearch {
    public static List<List<sObject>> searchContactsAndLeads(String searchTerm){
        List<List<sObject>> searchList = [
            FIND :searchTerm IN ALL FIELDS RETURNING Lead(LastName),Contact(LastName)
        ];
        return searchList;
    }
}