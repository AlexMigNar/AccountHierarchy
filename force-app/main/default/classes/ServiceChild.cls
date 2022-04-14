public with sharing class ServiceChild { 

   public static void updateParentDescription(List<Account> accountList) 
   { 
       for(Account acc : accountList)
       {  
            acc.Description =''; 
            List<Account> accounts = [ SELECT Id,Description,ParentId,Parent.Description,(  
                                       SELECT Id,Name,Description 
                                       FROM ChildAccounts),(  
                                       SELECT AccountId,Name,Birthdate 
                                       FROM Contacts ORDER BY Birthdate ASC LIMIT 1)    
                                       FROM Account   
                                       WHERE Id IN :Trigger.new];  
      for(Account account : accounts)
      {  
          if(account.ParentId ==  null && !account.ChildAccounts.isEmpty()) continue;  
  
          for (account child : account.ChildAccounts){  
              for (Contact con : account.Contacts){   
                  Date tod = Con.Birthdate;  
                  Integer temp = tod.daysBetween(date.today()) ;  
                  integer age = Integer.valueOf(temp/365);  


                  System.debug(Con.Birthdate);  
                  System.debug('No. of Days : '+temp);  
                  System.debug('Age:' +age);  

               acc.Description += String.format('The Child Account ID: {0} \n Child Account Name: {1}   \n Oldest Parent Account Contact : {2}  \n The Parent Account Contact Account ID: {3} \n The Parent Account Contact Birthdate: {4} \n Child Description: {5}',  
               new List<Object>{  child.Id, 
                                  child.Name,  
                                  Age,
                                  con.AccountId, 
                                  Con.Birthdate.format(),
                                  child.Description  
                              });  
              }   
         }  
     
 }  

 }  

}  

} 

 