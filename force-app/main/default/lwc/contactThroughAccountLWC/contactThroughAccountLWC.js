import { LightningElement,api} from 'lwc';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
import { CloseActionScreenEvent } from 'lightning/actions';
import CONTACT_OBJECT from '@salesforce/schema/Contact';
import NAME_FIELD from '@salesforce/schema/Contact.Name';
import EMAIL_FIELD from '@salesforce/schema/Contact.Email';
import PHONE_FIELD from '@salesforce/schema/Contact.Phone';
import ACCOUNTNAME_FIELD from '@salesforce/schema/Contact.AccountId';
import TITLE_FIELD from '@salesforce/schema/Contact.Title';

export default class ContactThroughAccountLWC extends LightningElement 
{
    @api recordId;
    objectApiName = CONTACT_OBJECT;
    contactName = NAME_FIELD;
    contactEmail = EMAIL_FIELD;
    contactPhone = PHONE_FIELD;
    contactAccountName = ACCOUNTNAME_FIELD;
    contactTitle = TITLE_FIELD;
    cName;
    cEmail;
    cPhone;
    cTitle;

    handleChange(event)
    {
        const wh = event.target.name;

        if(wh == 'contName'){
            this.cName = event.target.value;
        }
        else if(wh == 'contEmail'){
            this.cEmail = event.target.value;
        }
        else if(wh == 'contPhone'){
            this.cPhone = event.target.value;
        }
        else{
            this.cTitle = event.target.value;
        }
    }

    handleSubmit(event)
    {
        event.preventDefault();
        const fields = event.detail.fields;
        this.template.querySelector('lightning-record-edit-form').submit(fields);
    }

    handleSuccess(event)
    {
        this.dispatchEvent(new CloseActionScreenEvent());
        this.ShowToastEvent('Contact Created', 'Contact Record created Successfully','Success');
    }

    handleCancel(event)
    {
        this.dispatchEvent(new CloseActionScreenEvent());
    }

    ShowToastEvent(title,message,variant){
        const event = new ShowToastEvent({
            title,message,variant
        });
        this.dispatchEvent(event);
    }
}