public with sharing class AccountService2 { 

    // Method for updating account Description 
    
    public static void AccountDescriptionupdate(List<Account> accountList)  
    
    { 
    
        for (Account acc : accountList)  
    
    { 
   // acc.Description='';   
        List<Contact> contacts = [SELECT Name,AccountId,Birthdate FROM Contact WHERE AccountId = :Trigger.New ];  
    
                if(contacts.size()>0)  
    
                 {             
                     
                    acc.Description += '\n contact Name: ' + contacts[0].Name + '\n contact AccountId: ' +contacts[0].AccountId + '\n contact Birthdate: ' +contacts[0].Birthdate  ; 
       
                 } else { 
    
                        acc.Description = null; 
    
                        } 
    
    }  
    
    } 
    
    } 
    
     
     
    