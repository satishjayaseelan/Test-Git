public class MyController1 {

    public PageReference save() {
        return null;
    }


    public String acc ;
    
    public String getacc(){return acc;}
   
    public void setacc(String userinput)
    {
        this.acc = userinput;
    } 
    private final Account account;

    public MyController1() {
        account = [SELECT Id, Name, Site FROM Account 
                   WHERE Id = :ApexPages.currentPage().getParameters().get('id')];
    }

    public Account getAccount() {
        return account;
    }

  }