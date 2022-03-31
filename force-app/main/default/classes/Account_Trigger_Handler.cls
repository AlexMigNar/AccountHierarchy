public with sharing class Account_Trigger_Handler extends TriggerHandler{
    
    public override void afterUpdate()
    {
        List<Account> accountList = new List<Account>();
       // List<Account> accountList = [SELECT Id,(SELECT Id,Birthdate FROM Contacts ORDER BY Birthdate) FROM Account WHERE Id in: Trigger.new ];
        for(Account a: [SELECT Id,(SELECT Id,Birthdate FROM Contacts ORDER BY Birthdate ASC LIMIT 1) FROM Account WHERE Id in: Trigger.new ])
            // for(Account a:Trigger.New)
        {
            //Contact c = [SELECT Id,Birthdate FROM Contact WHERE Id =: a.Id ORDER BY Birthdate];
            if(a.Contacts.isEmpty()) return;


            a.Description = a.Contacts[0].Birthdate.format();
            // TODO: Prevent account to update if is the same Description
            // TODO: Do not include the new account in this list if new description is equal than current descriprion
            accountList.add(a);
        }
        update accountList;
    }
}