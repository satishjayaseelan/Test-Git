public class Actionsupport {
   list<Contact> conlist{get;set;}
    public PageReference findcontacts() {
       conlist= [select name from contact where name=:selectedValue];
        return null;
    }


    public String selectedValue { get; set; }

    
}