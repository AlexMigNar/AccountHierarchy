@IsTest
public with sharing class ChildService_Test {
     @IsTest
    static void updateParentDescription(){
        // Arrange
        Account parent = new Account(Name='Parent');
        Account child1 = new Account(Name='child1', Description='Hello');
        Account child2 = new Account(Name='child2', Description='World');
        insert new List<Account>{parent, child1, child2};

        child1.ParentId = parent.Id;
        child2.ParentId = parent.Id;

        // Act
        Test.startTest(); // What is this for
        update new List<Account>{child1, child2};
        Test.stopTest(); // What is this for

        // Assert
        List<Account> parentAfter = [SELECT Name,Description FROM Account];
        System.assertEquals('child1', parentAfter[1].Name);
    }
}
