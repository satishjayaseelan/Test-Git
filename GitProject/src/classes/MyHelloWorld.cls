public class MyHelloWorld{
public static void applyDiscount(Book_Order__c[] books) {
   for (Book_Order__c b :books){
      b.Price__c *= 0.9;
   }
}

}