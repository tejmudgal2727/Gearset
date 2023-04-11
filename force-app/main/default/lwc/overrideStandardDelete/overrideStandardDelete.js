import { LightningElement , api} from 'lwc';
import { deleteRecord } from 'lightning/uiRecordApi';
import { NavigationMixin } from 'lightning/navigation';
import { CloseActionScreenEvent } from 'lightning/actions';

export default class OverrideStandardDelete extends LightningElement 
{
    @api recordId;
    // isLoading = false;

    handleDelete(event)
    {
        deleteRecord(this.recordId).then(result=>{
            // this[NavigationMixin.Navigate]({
            //     type: 'standard__objectPage',
            //     attributes: {
            //         objectApiName: 'Account',
            //         actionName: 'Home',
            //     },
            // });
        }).catch();
        this.dispatchEvent(new CloseActionScreenEvent());
        this.navigateToObjectHome();
    }

    handleCancel(event)
    {
        this.dispatchEvent(new CloseActionScreenEvent());
        // this.isLoading = true;
    }

    navigateToObjectHome() {
        // Navigate to the Account home page
        this[NavigationMixin.Navigate]({
            type: 'standard__objectPage',
            attributes: {
                objectApiName: 'Account',
                actionName: 'home',
            },
        });
    }
}