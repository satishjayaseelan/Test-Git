trigger simpleTrigger on Account (after insert) {
	for(account a:Trigger.new)
	{
		
	}
	contact[] con= [select lastname from contact where accountid in:Trigger.new];
   System.debug('finished');
}