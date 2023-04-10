import { LightningElement } from 'lwc';

export default class LifeCycleHooks extends LightningElement {


    constructor(){

    // We can set the properties 
    // We can not access element OR Method
    // We can call apex method inside constructor
    // We can not create and dispatch custom event
    // We can not use navigation sevice
        super();
        
        alert('I am inside the constructor');
    }

    connectedCallback(){
        alert('I am inside the connected callback on parent');
    }

    disconnectedCallback(){
        alert('I am inside in the disconnected callback');
    }

    renderedCallback(){
        alert('Insode renderedCallback');
    }
}