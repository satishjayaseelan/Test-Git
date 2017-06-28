global class getLeadInfo{

WebService static Lead getLeadAddressByEmail(string LeadEmail)
    {
       Lead c= [ select Street,City,State,PostalCode from Lead where  Email=: LeadEmail];
       Lead l= new Lead (Street=c.Street,City=c.City,State=c.State,PostalCode = c.PostalCode );
       return l;
    }
}