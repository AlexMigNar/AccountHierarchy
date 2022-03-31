public with sharing class Contact_Trigger_Handler extends TriggerHandler
{
    public override void afterUpdate()
    {
        List<Account> accounts = [SELECT Id, (SELECT Id FROM Contacts ORDER BY Birthdate ASC LIMIT 1) FROM Account WHERE Id IN (SELECT AccountId FROM Contact WHERE ID IN :Trigger.new)];
        List<Account> accountList = new List<Account>();
        for (Account a : accounts){
            
            for (Contact c : a.Contacts){
                a.Description = c.Birthdate.format();
                accountList.add(a);
            }
        }
        update accountList;
    }
}