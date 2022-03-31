public with sharing class AccountDescription {
    public static void AccountDescriptionupdate(List<Account> accountDescrip) 
    {
        for(Account acc: accountDescrip){
            acc.Description = 'new contact';
        }

    }
    public static void createAccountDescrip()
    {
        //TriggerHandler.bypass();
    }
}
