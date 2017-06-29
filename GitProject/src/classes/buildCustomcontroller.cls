public class buildCustomcontroller {

public account acc;

public buildCustomcontroller()
{
  acc=[select id,name from account where id=:ApexPages.currentPage().getParameters().get('id')];
}
 
 public account getAccount()
 { 
   return acc;
 }

    


   
}