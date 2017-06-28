public with sharing class AddressFieldController {
public Account record{get; private set;}

    public AddressFieldController(ApexPages.StandardController controller) {
    record = [SELECT Id, Name, BillingCountry, BillingPostalCode, BillingState, BillingCity, BillingStreet, 
              BillingLatitude, BillingLongitude 
              FROM Account WHERE Id = :controller.getId()
            ]; 
    }

}