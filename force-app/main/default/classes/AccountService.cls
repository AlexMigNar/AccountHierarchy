public with sharing class AccountService {

   public static void AccountDescriptionupdate(List<Account> accountList){
      System.debug('AccountDescriptionupdate');
      Set<Id> accparentIds = new Set<Id>();
      
      for(Account acc : accountList){

         acc.Description = '\n This Account ID:  ' + acc.Id;
         acc.Description += '\n The Parent Account ID:  ' + acc.ParentId;

        // if (acc.ParentId == null || !acc.ChildAccounts.isEmpty()) continue;

         accparentIds.add(acc.Id);
         
         //System.debug('account ' + acc.Id + ' has parent Account');
         System.debug('Set of Parent Ids: ' + accparentIds);

      }
       
         List<Account> contactsToFind =  new List<Account>();
         
         Account oldCon = [SELECT Id, Description,
            (SELECT AccountId,Birthdate,Name
            FROM Contacts ORDER BY Birthdate ASC LIMIT 1) FROM Account
            WHERE Id IN :accparentIds ];

               System.debug('contact size ' + oldCon.contacts.size());
               System.debug('This Account Details: ' + oldCon.Description);

         for(Contact con : oldCon.Contacts){
            Date tod = con.Birthdate;
            Integer temp = tod.daysBetween(date.today()) ;
            integer age = Integer.valueOf(temp/365);

         if(oldCon.contacts.isEmpty()){
            System.debug('contact is Empty');
          } else {
            
            System.debug('contact Name: ' +con.Name);
            System.debug('contact Birthdate: ' +con.Birthdate);

            oldCon.Description += String.format('\n Oldest Contact Name: {0} \n Oldest Contact Birthdate: {1} \n Age of Oldest Contact: {2}',
               new List<Object>{
                  con.Name,
                  con.Birthdate.format(),
                  age

               });
              // oldCon.Description += 'contact Name: ' +con.Name ;
              // oldCon.Description += '\n contact Birthdate: ' +con.Birthdate ;
               
               System.debug('Account Description: ' +oldCon.Description);

            }
            contactsToFind.add(oldCon);
            
         }
         update contactsToFind;
      }
      
      

      }
   

   
