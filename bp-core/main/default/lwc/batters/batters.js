import { LightningElement, wire, api, track } from 'lwc';
import getBatters from '@salesforce/apex/BattersComponentController.getBatters';

const columns = [
    { label: 'Name', fieldName: 'Name' },
    { label: 'Pitches Thrown', fieldName: 'Pitches_Thrown__c', type: 'number' },
    { label: 'Strikes Thrown', fieldName: 'Strikes_Thrown__c', type: 'number' },
    { label: 'Balls Thrown', fieldName: 'Balls_Thrown__c', type: 'number' }
];

export default class Batters extends LightningElement {

    @api
    recordId;

    @track
    columns = columns;

    @wire(getBatters, { outingId: '$recordId' })
    batters;

}