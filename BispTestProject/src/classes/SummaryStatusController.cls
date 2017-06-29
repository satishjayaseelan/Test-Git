public class SummaryStatusController {
integer count;

    public Integer getVerylargesummarystatus() {
       count=[select count() from opportunity where Opportunity.IsClosed = true];
        return count;
    }

}