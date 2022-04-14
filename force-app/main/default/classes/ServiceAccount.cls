public with sharing class ServiceAccount {
    public static void AccountDescriptionupdate(List<Account> accountList) {
        
        List<Contact> contactAccountIds = new List<Contact>(); 
        for(Account acc : accountList){ 
                 System.debug(acc.Contacts);
           if(acc.Contacts != null){ 
           
           contactAccountIds.add(acc.Contacts); 
  
          // } 
    }

}
}
}
