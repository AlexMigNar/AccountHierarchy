public with sharing class ChildService
{

   public static void updateParentDescription(List<Account> accountList) {
      //Map<Id, Account> accountsByIds = (Map<Id, Account>)Trigger.newMap; // before update, after insert, after update  NOT  before insert
      Set<Id> parentAccountIds = new Set<Id>();
      Set<Id> ChildAccountIds = new Set<Id>();
    // accountsByIds.get(accountId);
     //accountsByIds.containsKey(accountId),
     System.debug(accountList);
   //  System.debug(accountsByIds);
     Map<Id,Account>  accMap= new Map<Id,Account>();

      for(Account acc : accountList){
        
         acc.Description='';
         acc.Description += String.format(' The Account ID: {0}',
         new List<Object>{  
          acc.Id 
                  
         }); 
         
         accMap.put(acc.id,acc); // Adding the accountID as key and Account record as value to the accMap

         System.debug(acc.ParentId);  
         System.debug(acc.ID);   
         

       if(acc.ParentId != null || !acc.ChildAccounts.isEmpty()){
            parentAccountIds.add(acc.ParentId);
            childAccountIds.add(acc.Id);
           
       }
         System.debug('Parent Id' + parentAccountIds);  
         System.debug('Child Id' + childAccountIds);    
         //System.debug('Accounts stored in the accMap as Key-value pair   :'+accMap);  
              
      }
      

      List<Account> accountsToUpdate = new List<Account>();
      
      Set<Id> accountIds = new Set<Id>(); // Save the Parent ID and Child IDs
      Set<Id> ChildAccIds = new Set<Id>();
      
      for(Account parent : [
         SELECT Id, Description,(
            SELECT Id,Name,Description 
            FROM ChildAccounts 
            ORDER BY CreatedDate ASC) 
         FROM Account 
         WHERE Id IN :parentAccountIds]
      ){
       
         //System.debug(parent.ChildAccounts);
         accountIds.add(parent.Id);
         System.debug(accountIds);
         for(Account child : parent.ChildAccounts){
            childAccIds.add(child.Id);
            accountIds.add(parent.Id);
            System.debug( childAccIds);

            if(child.Id == null){
               System.debug('Child Account is Empty');
               parent.Description += '';
            } else {
            parent.Description += String.format(' The Child Account ID: {0} \n Child Account Name: {1} \n Child Contact Description: {2}',  
               new List<Object>{  
                                 child.Id, 
                                 child.Name,
                                 child.Description
                                 
                               }); 
                           } 
         accountsToUpdate.add(parent);
         
      }
     
   }
       update accountsToUpdate; 
       
       
      
      

   List<Account> contactToFind = new List<Account>();
   Map<Id,Account>  conChildMap= new Map<Id,Account>();
      for(Account con : [
         SELECT Id,ParentId, Description,(SELECT AccountId,Name,Birthdate 
            FROM Contacts 
            ORDER BY Birthdate ASC 
            LIMIT 1) 
         FROM Account 
         WHERE Id IN :ParentAccountIds]){
         
                        System.debug(con.Id);
                      System.debug(childAccountIds);
                      conChildMap.put(con.Id,con);
                     
                      for(Contact cc : con.Contacts){
                        if(conChildMap.get(cc.Id)!= null){
                           cc.adderror('Contact already exists');
                        }
                        System.debug(conChildMap);
                        Date tod = cc.Birthdate;
                        Integer temp = tod.daysBetween(date.today()) ;
                        integer age = Integer.valueOf(temp/365);
                        System.debug(cc.Birthdate);
                        System.debug('No. of Days : '+temp);
                        System.debug('Age:' +age);
                       // con.description += conChildMap.get(cc.AccountId);
                        System.debug('Accounts stored in the accMap as Key-value pair   :'+ con.Description);
                     con.Description += String.format('\n The Oldest Contact: {0} \n Oldest Contact Age: {1} \n Oldest Contact Birthdate: {2}' ,
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


