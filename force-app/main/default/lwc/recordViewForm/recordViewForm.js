import { LightningElement,api } from 'lwc';
// import ACCOUNT_OBJECT from '@salesforce/schema/Account';
import NAME_FIELD from '@salesforce/schema/Account.Name';
import INDUSTRY_FIELD from '@salesforce/schema/Account.Industry';

export default class RecordViewForm extends LightningElement {
    //objectApiName = ACCOUNT_OBJECT;
    NameField = NAME_FIELD;
    IndustryField = INDUSTRY_FIELD;

    @api recordId;
    @api objectApiName;
}