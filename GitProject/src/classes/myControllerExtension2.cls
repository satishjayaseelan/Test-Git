public class myControllerExtension2 {
 public account acc;
 
 public myControllerExtension2 (ApexPages.StandardController std)
 {
     this.acc=(account)std.getrecord();
 }
   
   public String getgreeting()
   {
      return 'Hello ' + acc.name +' id : '+'('+ acc.Id+')';
   }
}