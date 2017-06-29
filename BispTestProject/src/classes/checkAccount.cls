@RestResource (urlMapping='/showAccounts/*')
global class checkAccount
{
  @HttpGet
  global static List<account> getAccount()
  {
    
    List<account> act;
    try
    {
      act=[select name,phone from account Limit 10];
      return act;
    }
    catch(Exception e)
    {
       system.debug('Error Message :'+e.getMessage());
    }
    
    return act;
    /*
    RestRequest req = RestContext.request;
    RestResponse res = RestContext.response;
    string accid = req.requestURI.substring (req.requestURI.lastindexof('/') +1);
    system.debug('accountid :'+ accid);
    account result = [select Id,name ,phone from account where Id=:accid];
    return result;
    */
  }
  
  @HttpPost
  global static string postAccount(string nam ,string ph,string num)
  {
    account a = new account();
    a.name = nam;
    a.phone = ph;
    a.AccountNumber = num;
    insert a;
     return 'Account created sucessfully Id : '+a.Id;
    
  }
  
 @HttpDelete
  global static void deleteAccount()
    {
      RestRequest req = RestContext.request;
      RestResponse res = RestContext.response;
      string accnum = req.requestURI.substring (req.requestURI.lastindexof('/') +1);
      account result = [select Id,name ,phone from account where accountnumber=:accnum ];
      delete result;
    }
}