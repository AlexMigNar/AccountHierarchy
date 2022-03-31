trigger AccountTriggerHandler on Account (before insert)
 {
     new Account_Trigger_Handler().run();
}