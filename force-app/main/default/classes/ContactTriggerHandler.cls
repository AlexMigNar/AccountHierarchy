public with sharing class ContactTriggerHandler extends TriggerHandler{
    public override void afterUpdate()
    {
        ServiceChild.updateParentDescription(Trigger.new);
    }
}
