public class opportunityList2Con {
public ApexPages.StandardSetController setCon{set;get{if(setCon==null)
                                            {
                                               setCon = new ApexPages.StandardSetController(Database.getQueryLocator([SELECT Name, CloseDate FROM Opportunity]));

                                              }             
                                              
                                              return setCon ;
                                                         }}
 public List<Opportunity> getOpportunities() {

        return (List<Opportunity>) setCon.getRecords();

    }                                                        
                                                         
}