public with sharing class AccountTriggerHandler extends TriggerHandler{
    public override void beforeUpdate()
    
    {
        System.debug('beforeUpdate');
        
        //ParentChildAccount.ChildAccountDetails(Trigger.new);
      ChildService3.updateParentDescription(Trigger.new);
       //AccountService2.AccountDescriptionupdate(Trigger.new);
     //ServiceChild.updateParentDescription(Trigger.new);
       // ServiceAccount.AccountDescriptionupdate(Trigger.new);
    }
}
