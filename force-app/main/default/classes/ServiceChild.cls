public with sharing class ServiceChild { 

   public static void updateParentDescription(List<Account> accountList) 
   { 
    Set<Id> parentAccountIds = new Set<Id>();
       for(Account acc : accountList)
       {  
        if(acc.ParentId != null)  {
        parentAccountIds.add(acc.ParentId);
       }
      
    }
            // Child details 

            List<Account> accounts = new List<Account>() ;  
      for(Account childAcc : [ SELECT Id,Description,ParentId,Parent.Description,(  
        SELECT Id,Name,Description 
        FROM ChildAccounts)
        FROM Account   
        WHERE Id IN :parentAccountIds])
      {  
         if(childAcc.ParentId ==  null && childAcc.ChildAccounts.isEmpty()) continue;  
  
          for (account child : childAcc.ChildAccounts){  
            
               childAcc.Description += String.format('The Child Account ID: {0} \n Child Account Name: {1} \n Child Description: {2}',  
               new List<Object>{  child.Id, 
                                  child.Name  
                                 // Age,
                                 // con.AccountId, 
                                //  Con.Birthdate.format(),
                                 // child.Description  
                              });  
                              accounts.add(childAcc);
              }
                 
         }  
     update accounts;
 } 

 } 