public class custgood {
public contact con;

    public contact getContactmethod2() {
        return con;
    }


    public contact getContactmethod1() {
      if(con==null)
      
         con=[select name,Id from contact limit 1];
         
     
        return con;
    }

}