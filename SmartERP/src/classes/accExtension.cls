public with sharing class accExtension {

    public accExtension(ApexPages.StandardController controller) {

    }
    
    public PageReference dosave(){
        PageReference myVFPage = new PageReference('/apex/apexdetailtag');
        myVFPage.setRedirect(true);
        myVFPage.getParameters().put('Id', '0016F00001vhuNa');
        return myVFPage;
    }
    public void doEdit(){
    }

}