import { LightningElement } from 'lwc';

export default class SimpleInterestCaculator extends LightningElement {
    amount;
    year;
    interestRate;
    interestCost;

    handleChange(event)
    {
        const wh = event.target.name;
        if(wh == 'amt'){
            this.amount = event.target.value;
        }
        else if(wh == 'years'){
            this.year = event.target.value;
        }
        else{
            this.interestRate = event.target.value;
        }
    }

    calculateInterest(event)
    {
        const principleAmount = parseInt(this.amount);
        const time = parseInt(this.year);
        const rate = parseInt(this.interestRate);

        this.interestCost = principleAmount*(1+rate/100*time);
    }

    clearData(event)
    {
        this.template.querySelectorAll('lightning-input').forEach(field=>{field.value=''});
    }
}