import { LightningElement,track,wire,api} from 'lwc';
import getPaymentRecords from '@salesforce/apex/PaymentEstimateController.getPaymentRecords';
import updatePayments from '@salesforce/apex/PaymentEstimateController.updatePayments'
import { refreshApex } from '@salesforce/apex';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';

const col = [
    { label : 'Payment Estimate Name' , fieldName : 'Payment_Estimate_Name__c'  },
    { label : 'Estimated Revenue' , fieldName : 'Estimated_Revenue__c' },
    { label : '%Estimate' , fieldName : 'Estimate__c' , editable:true, type: 'Percent'},
    { label : 'Earned Revenue' , fieldName : 'Amount__c' },
    { label : 'Invoice End Date' , fieldName : 'Payment_Date__c' },
    { label : 'Payment Date' , fieldName : 'Payment_DateR__c' }
];

const totCol = [
    { label : 'Payment Estimate Name' , fieldName : 'Payment_Estimate_Name__c'  , initialWidth: 195 },
    { label : 'Estimated Revenue' , fieldName : 'Estimated_Revenue__c' },
    { label : '%Estimate' , fieldName : 'Estimate__c' },
    { label : 'Earned Revenue' , fieldName : 'Amount__c' },
    { label : 'Invoice End Date' , fieldName : 'Payment_Date__c' },
    { label : 'Payment Date' , fieldName : 'Payment_DateR__c' }
];

export default class PaymentEstimateRelatedList extends LightningElement 
{
    @api recordId;
    column = col;
    totColumn = totCol;
    @track dataValue = [];
    @track saveDraftValues = [];
    isVisibleSingningAmount = false;
    oldTotalEstimate = 0;
    totalOppAmount = 0;
    singningAmount = 0;
    finalValue = 0;
    totalEstimate = 0;
    remainingAmount = 0;
    @track  totalData = [];
    @wire(getPaymentRecords , { oppId : '$recordId'})
    paymentEstimate({data,error}){
       
        if(data){
            
            data.find(singingamt => { 
                if(singingamt.Opportunity__r.Billing_Type__c == 'Flat' && singingamt.Payment_Estimate_Name__c == 'Signing Up'){
                    this.singningAmount = singingamt.Estimated_Revenue__c;
                    this.isVisibleSingningAmount = true;
                }
            })
             console.log('singningAmount -->>'+this.singningAmount)
            // Filter data
            let filterData = data.filter(payment => payment.Payment_Estimate_Name__c != 'Signing Up')
            
            console.log('filterData -->>'+JSON.stringify(filterData))

            this.dataValue = filterData;

            const totalEstimatedRev = filterData.reduce((ter, row) => {
                return ter + row.Estimated_Revenue__c;
              }, 0);
            const percentageEstimate = filterData.reduce((pe, row) => {
                return pe + row.Estimate__c;
              }, 0); 
              
              const earnedRevenue = filterData.reduce((er, row) => {
                return er + row.Amount__c;
              }, 0);  


            filterData.map(pay => {
                if(pay.Total_Opportunity_Amount_del__c != 0){
                    this.totalOppAmount = pay.Total_Opportunity_Amount_del__c;
                }
                if(pay.Estimate__c != null){
                    this.oldTotalEstimate += pay.Estimate__c;
                }
            })

            let totalDataRecord = [];
            totalDataRecord.push({
                Payment_Estimate_Name__c: 'Total',
                Estimated_Revenue__c: totalEstimatedRev,
                Estimate__c: percentageEstimate,
                Amount__c: earnedRevenue
              });
              this.totalData = totalDataRecord;
             // alert(JSON.stringify(this.totalData));
            console.log('Old Estimate -->>'+this.oldTotalEstimate);
        }
        else if(error){
            console.log('Error occured...');
        }
    }
    
    handleSave(event)
    {
        this.saveDraftValues = event.detail.draftValues;
        console.log('saveDraftValues -->>'+JSON.stringify(this.saveDraftValues));

        const result = this.dataValue.filter(ele => this.saveDraftValues.some(sd => sd.Id === ele.Id))
        console.log('result -->>'+JSON.stringify(result));

        result.map(res => this.saveDraftValues.map(cal => {
            if(res.Id === cal.Id){
                this.finalValue = res.Estimate__c - cal.Estimate__c;
                this.totalEstimate += this.finalValue;
                console.log('finalValue -->>'+JSON.stringify(this.finalValue));
                console.log('totalEstimate -->>'+JSON.stringify(this.totalEstimate));
            }
        }))

            //this.remainingAmount = Math.abs(100 - (this.oldTotalEstimate - this.totalEstimate));
            this.remainingAmount = 100 - (this.oldTotalEstimate - this.totalEstimate);
            console.log('oldTotalEstimate -->>'+this.oldTotalEstimate);
            console.log('remainingAmount -->>'+JSON.stringify(Math.round(this.remainingAmount)));
            // this.remainingAmount = res.Estimate__c > cal.Estimate__c ? Math.abs(100 - (this.oldTotalEstimate - this.totalEstimate)) : Math.abs(100 - (this.oldTotalEstimate + this.totalEstimate));
             
           // alert('remainingAmount==='+this.remainingAmount);

            if(this.remainingAmount > 100){
                this.ShowToast('Error' , 'Total estimate should be 100.' , 'error' , 'dismissable')
                this.totalEstimate = 0;
                this.remainingAmount = 0;
             }
            else{
                updatePayments({
                    lstPaymentList : JSON.stringify(this.saveDraftValues) , opportunityId : this.recordId})
                    .then(result =>{
                        // filter result and exclude the singing up record.
                        let filterResult = result.filter(paymentResult => paymentResult.Payment_Estimate_Name__c != 'Signing Up')
                        this.dataValue = filterResult;

                        const totalEstimatedRev = filterResult.reduce((ter, row) => {
                            return ter + row.Estimated_Revenue__c;
                          }, 0);
                        const percentageEstimate = filterResult.reduce((pe, row) => {
                            return pe + row.Estimate__c;
                          }, 0);  

                          const remainingPercentageEstimate = 100 - percentageEstimate;
                         // alert('remainingPercentageEstimate==='+remainingPercentageEstimate);
                          this.ShowToast('Error' , remainingPercentageEstimate + '% is missing in a total of 100' , 'error' , 'dismissable')


                          const earnedRevenue = filterResult.reduce((er, row) => {
                            return er + row.Amount__c;
                          }, 0);   

                          let totalDataRecord = [];
                          totalDataRecord.push({
                              Payment_Estimate_Name__c: 'Total',
                              Estimated_Revenue__c: totalEstimatedRev,
                              Estimate__c: percentageEstimate,
                              Amount__c : earnedRevenue
                            });
                            this.totalData = totalDataRecord; 
                           // alert(this.totalData)  ;

                        this.ShowToast('Success' , 'Record updated successfully.' , 'success' , 'dismissable')
                        // refreshing the saveDraftValues array 
                        //refreshApex(this.dataValue);

                        this.saveDraftValues = [];
                        
                        console.log('draft values -->>+'+this.saveDraftValues);
                        eval("$A.get('e.force:refreshView').fire();");
                        
                    })
                    .catch(error =>{
                        this.ShowToast('Error' , 'The sum percentage of the Payment estimate cannot be more than 100% for this Opportunity.' , 'error' , 'dismissable')
                    })
            }
             
        }  // HandleSave method ends here....
    
    ShowToast(title, message, variant, mode){
        const evt = new ShowToastEvent({
                  title: title,
                  message:message,
                  variant: variant,
                  mode: mode
            });
               this.dispatchEvent(evt);
    }
}