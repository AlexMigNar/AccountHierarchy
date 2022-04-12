public with sharing class ChildService
{

   public static void updateParentDescription(List<Account> accountList) {

      Set<Id> accountIds = new Set<Id>();
      for(Account acc : accountList){

         System.debug(acc.ParentId);
         System.debug(acc.Contacts);
         System.debug(acc.ChildAccounts);
         System.debug(acc.Description);

         if(acc.ParentId != null){
            accountIds.add(acc.ParentId);
         }
      
         // acc.Description ='';
         // List<Account> accounts = [
         //    SELECT Id,Description,ParentId,Parent.Description,(
         //    SELECT Id,Name,Description FROM ChildAccounts),(
         //    SELECT AccountId,Name,Birthdate FROM Contacts ORDER BY Birthdate ASC LIMIT 1)  
         //    FROM Account 
         //    WHERE Id IN :Trigger.new];
         //    // WHERE Id = :new Map<Id,Account>(accountList).keySet()];

         // for(Account account : accounts){
            
         //    if(account.ParentId ==  null && !account.ChildAccounts.isEmpty()) continue;
            
         //       for (account child : account.ChildAccounts){
         //          for (Contact con : account.Contacts){ 
         //             Date tod = Con.Birthdate;
         //             Integer temp = tod.daysBetween(date.today()) ;
         //             integer age = Integer.valueOf(temp/365);
         //             System.debug(Con.Birthdate);
         //             System.debug('No. of Days : '+temp);
         //             System.debug('Age:' +age);
         //          acc.Description = String.format('The Child ID: {0} \n Child Name: {1}   \n Oldest Child Contact : {2}  \n The Child Contact Account ID: {3} \n The Child Contact Birthdate: {4}',
         //          new List<Object>{
         //             child.Id,
         //             child.Name,
         //             Age,
         //             con.AccountId,
         //             Con.Birthdate.format()
                  
         //          });
         //       } 
         //    }
         // }
      }

      List<Account> accountsToUpdate = new List<Account>();
      for(Account parent : [SELECT Id,(SELECT Id,Description FROM ChildAccounts) FROM Account WHERE Id IN :accountIds]){
         String description = '';
         for(Account child : parent.ChildAccounts){
            description += child.Description;
         }
         accountsToUpdate.add(parent);
      }
      update accountsToUpdate;
   }
}