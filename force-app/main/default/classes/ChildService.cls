public with sharing class ChildService
{

   public static void updateParentDescription(List<Account> accountList) {

      Set<Id> parentAccountIds = new Set<Id>();
      Set<Id> ChildAccountIds = new Set<Id>();
      
      for(Account acc : accountList){
           //acc.Description='';
         System.debug(acc.ParentId);
         System.debug(acc.Contacts);
         System.debug(acc.ChildAccounts);
         System.debug(acc.Description);

         if(acc.ParentId != null){
            parentAccountIds.add(acc.ParentId);
         }
      

             
      }

      List<Account> accountsToUpdate = new List<Account>();
      for(Account parent : [SELECT Id, Description,(SELECT Id,Name,Description 
                            FROM ChildAccounts 
                            ORDER BY CreatedDate DESC) 
                            FROM Account 
                            WHERE Id IN :parentAccountIds]){
       
         System.debug(parent.Description);
         
         for(Account child : parent.ChildAccounts){
            System.debug(child.Description);
            parent.Description = String.format('\n The Account ID: {0} \n Account Name: {1}',  
               new List<Object>{  
                                 child.Id, 
                                 child.Name
                               
                              }); 
                           } 
         accountsToUpdate.add(parent);
      }
      update accountsToUpdate;
   
      List<Account> contactToFind = new List<Account>();
      for(Account con : [SELECT Id, Description,(SELECT AccountId,Name,Birthdate 
                            FROM Contacts 
                            ORDER BY Birthdate ASC 
                            LIMIT 1) 
                            FROM Account 
                            WHERE Id IN :parentAccountIds]){
         
                      
                      System.debug(con.Description);
         
                      for(Contact cc : con.Contacts){
                        Date tod = cc.Birthdate;
                        Integer temp = tod.daysBetween(date.today()) ;
                        integer age = Integer.valueOf(temp/365);
                        System.debug(cc.Birthdate);
                        System.debug('No. of Days : '+temp);
                        System.debug('Age:' +age);
  
                        //con.Description += cc.Birthdate.format();
                        con.Description += String.format('\n The Oldest Contact: {0} \n Oldest Contact Age: {1} \n Oldest Contact Birthdate: {2}',  
                        new List<Object>{  
                                 cc.Name, 
                                 Age,
                                 cc.Birthdate.format()
                               
                              });  
                      }
                      contactToFind.add(con);
                   }
                   update contactToFind;
      
   }
}

