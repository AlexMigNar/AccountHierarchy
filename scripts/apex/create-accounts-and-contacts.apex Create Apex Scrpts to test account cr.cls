// Create Apex Scrpts to test account and contact creation

Date today = Date.today();
System.debug(today);
System.debug([SELECT ID FROM Account WHERE ParentId != null LIMIT 1]);





// Scenario 1: Create a new Account and create 2 new Contacts
Account a = new Account(Name='Naina & Sons and Sons');
insert a;

a.Description = 'This is an updated account description';
update a;

Account acc = new Account(Name='Naina Industries');
insert acc;



insert new List<Contact>{
    new Contact(LastName='Contact 1',AccountId='0015400000nVsFhAAK',Birthdate=date.newInstance(1980,05,22)),
    new Contact(LastName='Contact 2',AccountId='0015400000nVsFhAAK',Birthdate=date.newInstance(1970,05,22).addMonths(5)),
    new Contact(LastName='Contact 3',AccountId='0015400000nVsFhAAK',Birthdate=date.newInstance(1960,05,22).addMonths(3))
};

List<Account> accounts = [SELECT Id,Description,(SELECT Id,Name,Description FROM ChildAccounts) FROM Account WHERE Id IN :Trigger.new ];
if(accounts.isEmpty()) return;
for(Account parent : accounts){
    System.debug(parent.Description);
    for(Account child : parent.ChildAccounts){
        System.debug(child.Description);
    }
}
delete acc;

acc.Description = 'No sé';
update acc;

// Scenario 2: Existing Account and create 2 new Contacts


    List<Account> accList = [SELECT Id, Name FROM Account Where Name =:'Naina & Sons' LIMIT 1];
    Contact c = new Contact();
    c.AccountId = accList[0].Id;
    c.LastName = 'batty';
    c.FirstName='Isabel';
    c.Phone='123454354';
    update c;




// Scenario 3: New Account and Existing 2 new Contacts

SELECT Id,Description,ParentId,Parent.Description,(
                SELECT Id,Name,Description FROM ChildAccounts),(
                SELECT Id,Name,Description FROM Contacts ORDER BY Birthdate ASC LIMIT 1)  
            FROM Account 
            WHERE Id = :accountList];

// Exexute SOQL with Selected Text
SELECT ParentId FROM Account

SELECT AccountId,Account.Name,Account.Description FROM Contact

a.Description = a.Contacts[0].Birthdate.format()

SELECT Birthdate FROM Contact WHERE Birthdate!= null ORDER BY Birthdate ASC LIMIT 1
delete[SELECT Birthdate FROM Contact];



// Delete after each scenario
delete [SELECT Id FROM Account WHERE Name != 'Sample Account for Entitlements'];
delete [SELECT Id,Description,ParentId,Parent.Description,(SELECT Id,Name,Description FROM ChildAccounts),(SELECT Id,Name,Birthdate FROM Contacts ORDER BY Birthdate ASC LIMIT 1) from Account];
delete[SELECT Id,Name,Description,(SELECT Id,Name, Description FROM ChildAccounts) FROM Account];
delete[SELECT Id, Name FROM Account Where Name =:'Naina Inc' LIMIT 1];
delete[SELECT Birthdate FROM Contact WHERE Birthdate!= null ORDER BY Birthdate ASC LIMIT 1];
delete[SELECT Id,(SELECT Id,Name, Description FROM ChildAccounts),(SELECT AccountId,Birthdate,Name FROM Contacts) FROM Account];
delete[Select Id,(SELECT Id,Name, Description FROM ChildAccounts) FROM Account];
// running force:data:soql:query:  This command requires a username. Specify it with
sfdx config:set defaultusername=naina.rao.salesforce@brave-hawk-b60irg.com

// Scenario 4: Existing Account and change the field records

insert 
List<Account> accList = [SELECT Id, Name, AccountNumber FROM Account Where Id = '0018c00002GwTJWAA3'];
//Account a = new Account();
//a.AccountId = accList[0].Id;
for(Account a:accList){
a.AccountNumber = 'gfdgfdgdfgdsgdfgd34398490584yhtryhdfghdfgb3253';}
update accList;



if(Description=='')

List<Account> accountList = [SELECT ID FROM Account WHERE Id = '0017e00001W8M19AAF' LIMIT 1];
ChildService.updateParentDescription(accountList);

// Calculate age



// Account Hierarchy
String parentId;
for(Integer i=0 ; i<5; i++){
    Account acc = new Account(Name='Naina Industries' + i);
    if(parentId != null){
        acc.ParentId = parentId;
    }
    insert acc;
    parentId = acc.Id;
}


Account acc1 = new Account(Name='Naina Industries 1');
insert acc1;

Account acc2 = new Account(Name='Naina Industries 2');
acc2.ParentId= acc1;
insert acc2;

Account acc3 = new Account(Name='Naina Industries 3');
acc3.ParentId= acc2;
insert acc3;

Account acc4 = new Account(Name='Naina Industries 4');
acc4.ParentId= acc3;
insert acc4;

Account acc5 = new Account(Name='Naina Industries 5');
acc5.ParentId= '0017e00001WUUe1AAH';
insert acc5;

insert more

SELECT Id, 
ParentId, 
Parent.ParentId, 
Parent.Parent.ParentId
Parent.Parent.Parent.ParentId
Parent.Parent.Parent.Parent.ParentId
Parent.Parent.Parent.Parent.Parent.ParentId
Parent.Parent.Parent.Parent.Parent.Parent.ParentId
Parent.Parent.Parent.Parent.Parent.Parent.Parent.ParentId
Parent.Parent.Parent.Parent.Parent.Parent.Parent.Parent.ParentId
Parent.Parent.Parent.Parent.Parent.Parent.Parent.Parent.Parent.ParentId
Parent.Parent.Parent.Parent.Parent.Parent.Parent.Parent.Parent.Parent.ParentId
FROM Account WHERE Id from acc1

delete[SELECT Id, 
ParentId, 
Parent.ParentId, 
Parent.Parent.ParentId 
FROM Account];  


 to calculate Age
