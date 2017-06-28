public with sharing class Actionsupport1 {

    public list<String> contacttoshow{get;set;}
      
    public PageReference findcontact() {
    contacttoshow = new list<string>();
    list <contact> conlist;
    if(selectedvalue!='None')
        {
             conlist= [select name from contact where account.name=:selectedvalue];
        }
    
        for(contact c:conlist )
            {
              contacttoshow.add(c.name);
            }
        return null;
    }
 

    public String selectedValue { get; set; }
}