import { LightningElement,track,api } from 'lwc';
import getContacts from '@salesforce/apex/contactControllerForLWC.getContacts';

const column = [
    { label : 'Contact Name' , fieldName : 'Name'},
    { label : 'Email' , fieldName : 'Email' }
];

export default class DataTableWithSearhingFunctionality extends LightningElement {
    dynamicLabel = 'Show Contacts';
    isVisible = false;
    // value = '';

    @api recordId;
    @track columns = column;
    @track data = [];
    @track data1 = [];
    // @track filterData = [];

    connectedCallback(){
        getContacts({accountRecId : this.recordId})
            .then(result =>{
                this.data1 = this.data = result;
            })
            .catch(error =>{
                alert('Promise in rejected stage'+error);
            })
    }

    handleChange(event){
        let value = event.target.value;
        
        this.data1 = this.data.filter(d => d.Name.includes(value) || d.Email.includes(value));
        console.log('Filter Data -->>'+JSON.stringify(this.filterData));
        // getContacts({accountRecId : this.recordId , searchKey : this.value})
        //     .then(res =>{
        //         this.data = res;
        //     })
        //     .catch(error =>{
        //         alert('Search Error');
        //     })
     }

    handleClick(event){
        const labelValue = event.target.label;

        if(labelValue === 'Show Contacts'){
            this.dynamicLabel = 'Hide Contacts';
            this.isVisible = true;
        }
        else if(labelValue === 'Hide Contacts'){
            this.dynamicLabel = 'Show Contacts';
            this.isVisible = false;
        }
    }
}