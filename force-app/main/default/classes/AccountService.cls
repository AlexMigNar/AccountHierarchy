public with sharing class AccountService {

   public static void AccountDescriptionupdate(List<Account> accountList){
      System.debug('AccountDescriptionupdate');
      for(Account acc : accountList){

         //if (acc.ParentId == null) continue;
         //System.debug('account ' + acc.Id + 'has parent Account');

         List<Contact> contacts = [
            SELECT AccountId,Birthdate,Name
            FROM Contact
            WHERE AccountId = :Trigger.New ];

         System.debug('contact.size ' + contacts.size());

         if(contacts.isEmpty()){
            System.debug('contact is Empty');
            acc.Description = null;
         } else {
            System.debug('contact is not Empty');
            acc.Description = String.format('The Contact ID: {0} Contact Name: {1} Oldest Contact Birthdate: {2}',
               new List<Object>{
                  acc.Id,
                  contacts[0].Name,
                  contacts[0].Birthdate.format()
               });

            //acc.Description = contacts[0].Birthdate.format();
         }
      }
   }
}