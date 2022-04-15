public with sharing class AccountTriggerHandler extends TriggerHandler{
    public override void beforeUpdate()
    
    {
        System.debug('beforeUpdate');
        //AccountService.AccountDescriptionupdate(Trigger.new);
        //ParentChildAccount.ChildAccountDetails(Trigger.new);
       ChildService.updateParentDescription(Trigger.new);
        //ServiceChild.updateParentDescription(Trigger.new);
       // ServiceAccount.AccountDescriptionupdate(Trigger.new);
    }
}
