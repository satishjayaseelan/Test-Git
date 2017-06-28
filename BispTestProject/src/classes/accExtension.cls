public with sharing class accExtension {

    public accExtension(ApexPages.StandardController controller) {

    }
    public PageReference dosave(){
   
        PageReference myVFPage = new PageReference('/apex/detailpage');
        myVFPage.setRedirect(true);
        myVFPage.getParameters().put('Id', '0016F00001sW0ip');
        return myVFPage;
    }
    public void doEdit(){
    }
}