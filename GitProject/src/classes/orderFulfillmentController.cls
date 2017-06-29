public with sharing class orderFulfillmentController {

    public String Name { get; set; }

    public String orderName { get; set; }

    public String accountData { get; set; }
    
    private String orderId;   
    
    public orderFulfillmentController ()
    {       
        orderId = ApexPages.CurrentPage().getparameters().get('id');
        
        List<Book_Order__c> bOrder=[select name from Book_Order__c where id =:orderId ]; 
        
        if(bOrder.size() > 0){
        
        Name= bOrder[0].Name; 
        }
    }
    
    
}