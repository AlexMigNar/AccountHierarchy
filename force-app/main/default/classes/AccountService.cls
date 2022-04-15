public with sharing class AccountService {

   public static void AccountDescriptionupdate(List<Account> accountList){
      System.debug('AccountDescriptionupdate');
      for(Account acc : accountList){

         //if (acc.ParentId == null) continue;
         //System.debug('account ' + acc.Id + 'has parent Account');
        // acc.Description = '';
         List<Contact> contacts = [
            SELECT AccountId,Birthdate,Name
            FROM Contact 
            WHERE AccountId IN :Trigger.New ];

            Date tod = contacts[0].Birthdate;
            Integer temp = tod.daysBetween(date.today()) ;
            integer age = Integer.valueOf(temp/365);

         System.debug('contact.size ' + contacts.size());

         if(contacts.isEmpty()){
            System.debug('contact is Empty');
            acc.Description = null;
         } else {
            System.debug('contact is not Empty');
            acc.Description = String.format('The Oldest Contact ID: {0} \n Contact Name: {1} \n Oldest Contact Birthdate: {2} \n Age of Oldest Contact: {3}',
               new List<Object>{
                  contacts[0].AccountId,
                  contacts[0].Name,
                  contacts[0].Birthdate.format(),
                  age

               });

            //acc.Description = contacts[0].Birthdate.format();
         }
      }
   }
}