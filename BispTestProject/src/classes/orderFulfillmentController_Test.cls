/*********************************************************************************************************
ClassName:              orderFulfillmentController_Test 
Created Date:           Nov-22-2015
Created By:             Ataullah Khan
Revisions/Fixes:
Revisions/Fixes Date:
Purpose of the Class:   This is a test class that covers the Oderfulfillment page functionality.
                        This test class tests different aspects of the class positive and negative,
                        It is environment independent and uses ample amount of data to test the pagination functionality.
***********************************************************************************************************/

@isTest
public class orderFulfillmentController_Test {
    
    //This method covers the pagination functionality of OrderFulfillment page.
    //It creates 100 OLI records and call different SetController methods to validate them.
    //Apart from that It also keepsa check that during pagination selected records retain values.
    /*
    public static testMethod void testController1(){
       
       //Creating an account       
       Account acc = testUtility.createAccount();
       insert acc;
       
       //Creating Reward points records
       List<Reward_Points_Values__c> rList = testUtility.createRewardPoint();
       insert rList;
       
       //Creating a list of product
       List<product2> pdtList =  testUtility.createProduct(10);
       insert pdtList;
       
       // Creating  List of contact records
       List<Contact> conList = testUtility.createContact(acc.Id,10);
       insert conList;
       
       // Creating Book Order Items record
       Book_Order__c  bOrder  = testUtility.createBookOrder(acc.Id);
       insert bOrder;
       
       // Creating Order Line Item(OLI) records
       List<Order_Line_Item__c> OliList = testUtility.createOLI(bOrder.Id,conList,pdtList);
       insert oliList;
       
       //Actual Test Starts here
       Test.startTest();
       
       //Setting Test page
       PageReference pageRef = Page.orderFulfillment; 
       Test.setCurrentPage(pageRef);
       
       //Putting a valid parameter in The URL
       ApexPages.currentPage().getParameters().put('oid', bOrder.id);
       
       //Calling contructor for the Class under consideration
       orderFulfillmentController orderFulfmt = new  orderFulfillmentController();
       
       //Calling the wrapper list that contains standardSetController(indirectly calling pagination Element) 
       List<orderFulfillmentController.oliWrapper> wraprList = orderFulfmt.getorderItems();
       
       //paginating to the last page
       orderFulfmt.last();
       //paginating to the first page
       orderFulfmt.first();
       
       //Looping through the Paginated records and selecting every even numbered row
       for(integer i=1;i<=orderFulfmt.totalPages;i++){            
            integer count = 1;
            
           for(orderFulfillmentController.oliWrapper oliWrapr: wraprList){
               
                if(Math.Mod(count,2) == 0){
                    
                    oliWrapr.checked = True;
                }
               count++;
            }//paginating to next page
            if(orderFulfmt.hasNext){
               System.assertEquals(orderFulfmt.pageNumber,i);
               orderFulfmt.next();               
            }//If reached last page then break
            else{
                break;
            }   
        }
        //Looping through the Paginated records and testing that the list retains selected records during pagination
        for(integer i=1;i<=orderFulfmt.totalPages;i++){            
            integer count = 1;
            
           for(orderFulfillmentController.oliWrapper oliWrapr: wraprList){
               
                if(Math.Mod(count,2) == 0){
                    
                    System.assertEquals(oliWrapr.checked,True);
                }
               count++;
            }//Paginating backwwards till the first page
            if(orderFulfmt.hasPrevious){
               
               orderFulfmt.previous();
            }// Break the loop if first page is reached
            else{
               break;
            }               
        }
        // Save the above selected records in the system
        pagereference bOrderPage = orderFulfmt.process();
        Test.StopTest();
       
    }
    
    //This test method is used to do negative testing.
    // Book Order ID parameter in the URL is intentionally given incorrect
    //The exception is handled in the code
    public static testMethod void testController2(){
       //Creating an account 
       Account acc = testUtility.createAccount();
       insert acc;
       //Creating Reward points records
       List<Reward_Points_Values__c> rList = testUtility.createRewardPoint();
       insert rList;
       //Creating a list of product
       List<product2> pdtList =  testUtility.createProduct(10);
       insert pdtList;
       // Creating  List of contact records
       List<Contact> conList = testUtility.createContact(acc.Id,10);
       insert conList;
       // Creating Book Order Items record
       Book_Order__c  bOrder  = testUtility.createBookOrder(acc.Id);
       insert bOrder;
       // Creating Order Line Item(OLI) records
       List<Order_Line_Item__c> OliList = testUtility.createOLI(bOrder.Id,conList,pdtList);
       insert oliList;
       
       //Actual Test Starts here
       Test.startTest();
       //Setting Test page
       PageReference pageRef = Page.orderFulfillment;
       Test.setCurrentPage(pageRef);
       //Putting wrong OLI Id parameter in the URL
       ApexPages.currentPage().getParameters().put('oid', acc.id);
       // calling constructor of the class in consideration
       orderFulfillmentController orderFulfmt = new  orderFulfillmentController();
       // Fetching Paginated data
       List<orderFulfillmentController.oliWrapper> wraprList = orderFulfmt.getorderItems();
       Test.stopTest();
       //Test ends here
    }
    
    //Testing the retainability of the selected records while pagination and doing filters on selected contact
    public static testMethod void testController3(){
       //Creating an account 
       Account acc = testUtility.createAccount();
       insert acc;
       //Creating Reward points records
       List<Reward_Points_Values__c> rList = testUtility.createRewardPoint();
       insert rList;
       //Creating a list of product
       List<product2> pdtList =  testUtility.createProduct(10);
       insert pdtList;
       // Creating  List of contact records
       List<Contact> conList = testUtility.createContact(acc.Id,10);
       insert conList;
       // Creating Book Order Items record
       Book_Order__c  bOrder  = testUtility.createBookOrder(acc.Id);
       insert bOrder;
       // Creating Order Line Item(OLI) records
       List<Order_Line_Item__c> OliList = testUtility.createOLI(bOrder.Id,conList,pdtList);
       insert oliList;
       
       //Actual test starts here
       Test.startTest();
       //Setting page for testing
       PageReference pageRef = Page.orderFulfillment;
       Test.setCurrentPage(pageRef);
       //appending correct book order id in the URL
       ApexPages.currentPage().getParameters().put('oid', bOrder.id);
       //Calling constructor of the controller under consideration
       orderFulfillmentController orderFulfmt = new  orderFulfillmentController();
       
       //paginating over 3 pages and selecting even numbered rows starting from '0'  
       //and changing filter value to validate that no slection is lost while paginating and filtering records       
       for(integer count=0;count<3;count++){            
           integer num = 0;
                      
           for(orderFulfillmentController.oliWrapper oliWrapr: (List<orderFulfillmentController.oliWrapper>)orderFulfmt.getorderItems()){
                   
                    if(Math.Mod(num,2) == 0){
                        
                       oliWrapr.checked = True;     
                    } num++;                     
           } 
                       
           if(orderFulfmt.hasNext){
               orderFulfmt.next();               
           }
           
           if(count == 2){
              //changing filter value
              orderFulfmt.selectedVal = conList[3].Name;
              //calling onchange filter method
              orderFulfmt.filterData();
              orderFulfmt.getorderItems(); 
           }
       }
       //setting value in the filter
       orderFulfmt.selectedVal = '--All Students--';
       //calling onchange filter method
       orderFulfmt.filterData();
       //saving the selected records
       orderFulfmt.process();
       //only the selected 9 records are processed and none are lost while paginating and changing filter.
       system.assertEquals(9,orderFulfmt.updatedOli.size());
       Test.Stoptest();
       //Test ends here 
       
    }
    
    //Testing the cancel button functionality
    public static testMethod void testController4(){
    
       //Creating an account 
       Account acc = testUtility.createAccount();
       insert acc;
       //Creating Reward points records
       List<Reward_Points_Values__c> rList = testUtility.createRewardPoint();
       insert rList;
       //Creating a list of product
       List<product2> pdtList =  testUtility.createProduct(10);
       insert pdtList;
       // Creating  List of contact records
       List<Contact> conList = testUtility.createContact(acc.Id,10);
       insert conList;
       // Creating Book Order Items record
       Book_Order__c  bOrder  = testUtility.createBookOrder(acc.Id);
       insert bOrder;
       // Creating Order Line Item(OLI) records
       List<Order_Line_Item__c> OliList = testUtility.createOLI(bOrder.Id,conList,pdtList);
       insert oliList;
       
       //Actual test starts here
       Test.startTest();
       //Setting page for testing
       PageReference pageRef = Page.orderFulfillment;
       Test.setCurrentPage(pageRef);
       //appending correct book order id in the URL
       ApexPages.currentPage().getParameters().put('oid', bOrder.id);
       //Calling constructor of the controller under consideration
       orderFulfillmentController orderFulfmt = new  orderFulfillmentController();
       // Fetching Paginated data
       List<orderFulfillmentController.oliWrapper> wraprList =  orderFulfmt.getOrderItems();
       
       Pagereference newpageref = orderFulfmt.cancel();
     
       Test.StopTest();
       //Test ends here
    }
    
    //Testing the scenario when the paginated list contains a list of shipped items 
    //(that are shown as selected but disabled on the VF) along with non shipped OLIs
    //During the test we select some records to be shipped and simulated saving them
    //only the non-shipped status items are used for updation.  
    public static testMethod void testController5(){
    
       //Creating an account 
       Account acc = testUtility.createAccount();
       insert acc;
       //Creating Reward points records
       List<Reward_Points_Values__c> rList = testUtility.createRewardPoint();
       insert rList;
       //Creating a list of product
       List<product2> pdtList =  testUtility.createProduct(10);
       insert pdtList;
       // Creating  List of contact records
       List<Contact> conList = testUtility.createContact(acc.Id,10);
       insert conList;
       // Creating Book Order Items record
       Book_Order__c  bOrder  = testUtility.createBookOrder(acc.Id);
       insert bOrder;
       // Creating Order Line Item(OLI) records

       List<Order_Line_Item__c> OliList = new List<Order_Line_Item__c>();
       Integer count = 0;
       for(Order_Line_Item__c oli : testUtility.createOLI(bOrder.Id,conList,pdtList)){
           //setting every even record as shipped staring from 0
           if(Math.Mod(count,2) == 0){
               oli.Shipping_Status__c = constantsClass.SHIPPED;
           }count++;
           OliList.add(oli);
       }       
       insert oliList;
       
       //Actual test starts here
       Test.startTest();
       //Setting the test page
       PageReference pageRef = Page.orderFulfillment;       
       Test.setCurrentPage(pageRef);
       //setting the URL parameter for bookOrder
       ApexPages.currentPage().getParameters().put('oid', bOrder.id);
       //calling constructor
       orderFulfillmentController orderFulfmt = new  orderFulfillmentController();              
       
       integer num = 0;
       //marking the odd rows in the first page as selected with status other than shipped              
       for(orderFulfillmentController.oliWrapper oliWrapr: (List<orderFulfillmentController.oliWrapper>)orderFulfmt.getOrderItems()){
           
            if(! (Math.Mod(num,2) == 0)){
                
               oliWrapr.checked = True;     
            } num++;                     
       }
       orderFulfmt.next();
       //Updating status
       orderFulfmt.process();
       //Proof that Shipped items are nottaken into calculation
       system.assertEquals(2,orderFulfmt.updatedOli.size());
       
       Test.StopTest();
       //Test ends here
    }
    
    //Testing the scenario when the paginated list has a number of shipped items but 
    // no other records are selected for processing and save button is clicked
    public static testMethod void testController6(){
       
       //Creating an account 
       Account acc = testUtility.createAccount();
       insert acc;
       //Creating Reward points records
       List<Reward_Points_Values__c> rList = testUtility.createRewardPoint();
       insert rList;
       //Creating a list of product
       List<product2> pdtList =  testUtility.createProduct(10);
       insert pdtList;
       // Creating  List of contact records
       List<Contact> conList = testUtility.createContact(acc.Id,10);
       insert conList;
       // Creating Book Order Items record
       Book_Order__c  bOrder  = testUtility.createBookOrder(acc.Id);
       insert bOrder;
       // Creating Order Line Item(OLI) records

       List<Order_Line_Item__c> OliList = new List<Order_Line_Item__c>();
       Integer count = 0;
       for(Order_Line_Item__c oli : testUtility.createOLI(bOrder.Id,conList,pdtList)){
           //setting every even record as shipped staring from 0
           if(Math.Mod(count,2) == 0){
               oli.Shipping_Status__c = constantsClass.SHIPPED;
           }count++;
           OliList.add(oli);
       }       
       insert oliList;
       
       //Actual test starts here
       Test.startTest();
       //Setting the test page
       PageReference pageRef = Page.orderFulfillment;       
       Test.setCurrentPage(pageRef);
       //setting the URL parameter for bookOrder
       ApexPages.currentPage().getParameters().put('oid', bOrder.id);
       //calling constructor
       orderFulfillmentController orderFulfmt = new  orderFulfillmentController();              
       //fetch paginated data
       List<orderFulfillmentController.oliWrapper> wraprList =  orderFulfmt.getOrderItems();
       //process selected records
       orderFulfmt.process();
       System.assertEquals(0,orderFulfmt.updatedOli.size());
       Test.StopTest();
       //Test ends here
    }
    */
}