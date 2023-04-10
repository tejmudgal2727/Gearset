import { LightningElement,track, wire } from 'lwc';
import getAccountRecord from '@salesforce/apex/AccountController.getAccountRecord';

const column = [
    { label : "Id" , fieldName : "Id"},
    { label : "Industry" , fieldName : "Industry"}
];

export default class ImperativeCall extends LightningElement {
    titleMessage = "Imperative Get Account Info";

    @track coulmns = column;
    @track data = [];

    // connectedCallback(){
    //     getAccountRecord()
    //         .then(result =>{
    //             this.data = JSON.stringify(result);
    //             // alert('Result -->>'+this.data);
    //         })
    //         .catch(error =>{
    //             alert('Promise in rejected stage');
    //         })
        
    // }

    @wire(getAccountRecord)
        wiredAccounts({data,error}){
            if(data){
                this.data = data;
            }
            else if(error){
                alert('Promise in rejected stage');
            }
        }

}