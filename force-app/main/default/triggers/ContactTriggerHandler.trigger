trigger ContactTriggerHandler on Contact (before update)
{
    new Contact_Trigger_Handler().run();

}