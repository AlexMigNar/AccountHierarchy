// Create Apex Scrpts to test account and contact creation

// Scenario 1: Create a new Account and create 2 new Contacts
Account a = new Account(Name='Naina Inc');
insert a;


insert new List<Contact>{
    new Contact(LastName='Contact 1',AccountId=a.Id, Birthdate=Date.today()),
    new Contact(LastName='Contact 2',AccountId=a.Id, Birthdate=Date.today().addMonths(5))
};


// Scenario 2: Existing Account and create 2 new Contacts


// Scenario 3: New Account and Existing 2 new Contacts


// Exexute SOQL with Selected Text
SELECT Id,Name,Description,(SELECT Id,Birthdate FROM Contacts) FROM Account

SELECT Id,Name,Birthdate,AccountId,Account.Name,Account.Description FROM Contact


// Delete after each scenario
delete [SELECT Id FROM Account WHERE Name != 'Sample Account for Entitlements'];
delete [SELECT Id FROM Contact];