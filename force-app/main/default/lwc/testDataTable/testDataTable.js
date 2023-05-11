import { LightningElement,track,api,wire } from 'lwc';
import getPaymentRecords from '@salesforce/apex/PaymentEstimateController.getPaymentRecords';

export default class TestDataTable extends LightningElement 
{
    @track paymentEstimateColumn = [
        { label : 'Payment Estimate Name' },
        { label : 'Estimated Revenue' },
        { label : '%Estimate' , editable : true},
        { label : 'Earned Revenue' },
        { label : 'Invoice End Date' },
        { label : 'Payment Date' }
    ];

    @api recordId = '006Ei000003RgJBIA0';
    @track paymentEstimate = [];

    @wire(getPaymentRecords , { oppId : '$recordId'})
    paymentEstimateRecords({data,error}){
        if(data){
            this.paymentEstimate = data.filter(payment => payment.Payment_Estimate_Name__c != 'Signing Up')
        }
        else if(error){
            this.data = undefined;
        }
    }

    handleClick(event){
        
    }
}