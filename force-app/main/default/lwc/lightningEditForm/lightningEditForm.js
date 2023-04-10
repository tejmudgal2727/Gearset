import { LightningElement , api } from 'lwc';
import NAME_FIELD from '@salesforce/schema/Contact.Name';
import EMAIL_FIELD from '@salesforce/schema/Contact.Email';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';

export default class LightningEditForm extends LightningElement 
{
    @api recordId;
    @api objectApiName;
    nameField = NAME_FIELD;
    emailField = EMAIL_FIELD;


    handleSubmit(event)
    {
        event.preventDefault();
        const fields = event.detail.fields;
        this.template.querySelector('lightning-record-edit-form').submit(fields);        
    }

    handleSuccess(event)
    {
        this.ShowToastEvent('Record Updated','Contact Record Updated Successfully','Success','dismissable');
    }

    ShowToastEvent(title,message,variant,mode)
    {
        const event = new ShowToastEvent({
            title,message,variant,mode
        });
        this.dispatchEvent(event);
    }
}