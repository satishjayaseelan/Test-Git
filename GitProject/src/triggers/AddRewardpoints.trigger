trigger AddRewardpoints on Contact (after update) {
Integer count=0;

list< Order_Line_Item__c > line =[select Name, Rewards_Points__c from Order_Line_Item__c where Student__c IN :Trigger.new];
 
for(Order_Line_Item__c od:line)
 {
     
     count+=(Integer)od.Rewards_Points__c;
     
 }

if (Trigger.isUpdate)
 {

    for (Contact a : Trigger.new)
         {
             a.Rewards_Points__c= count;
          }
}
}