public with sharing class ParentChildAccount {
    public static void ChildAccountDetails(List<Account> accountList) 
    
    { 
        Set<Id> ids=new Set<Id>();
        for (Account acc : accountList)  
        
        { 
           
           if (acc.ParentId != null)
          
                          
                        {
                            ids.add(acc.Id);    // collect the child account id for each account in a set
                        }
        

                        //collect the all DETAILS related to these child account  id

                         List<Account> ac=[select id,Name, Description from Account WHERE Id IN :ids ];

                         //Map<Id,List<Account>> accMap = new map<Id,List<Account>>();
                         Map<Id,List<Account>> accMap = new map<Id,List<Account>>();
                                  
                                for(Account a:ac)
                                         {
                                             if(accMap.containsKey(a.Id))

                                                 {
               
                                                     (accMap.get(a.Id)).add(a);
                                                                
                                                 }
               
                                                  else
               
                                                 {
               
                                                     accMap.put(a.Id,new List<Account>{a});
               
                                                 }
                                         }
        }
              

    }
}
