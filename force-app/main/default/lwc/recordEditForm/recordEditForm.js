import { LightningElement } from 'lwc';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';

import OBJECT_NAME from '@salesforce/schema/Contact';
import FIRST_NAME from '@salesforce/schema/Contact.FirstName';
import LAST_NAME from '@salesforce/schema/Contact.LastName';
import EMAIL_Id from '@salesforce/schema/Contact.Email';
import ACCOUNT_Id from '@salesforce/schema/Contact.AccountId';

export default class RecordEditForm extends LightningElement {

    objectApiName = OBJECT_NAME;
    firstName = FIRST_NAME;
    lastName = LAST_NAME;
    emailId = EMAIL_Id;
    accountId = ACCOUNT_Id;
    contactId;

    handleSuccess(event){

        this.contactId = event.detail.id;

        const events = new ShowToastEvent({
            title : 'Contact Record',
            message : 'New Contact Created Successfully' +this.contactId,
            variant : 'Success'
        })
        this.dispatchEvent(events);
    }
}