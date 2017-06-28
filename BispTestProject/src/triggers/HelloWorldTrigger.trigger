trigger HelloWorldTrigger on Book_Order__c (before insert) {
Book_Order__c [] books = Trigger.new;
MyHelloWorld.applyDiscount(books);
}