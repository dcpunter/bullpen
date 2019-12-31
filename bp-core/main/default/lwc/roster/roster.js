import { LightningElement, wire } from 'lwc';
import getRoster from '@salesforce/apex/RosterComponentController.getRoster';

export default class Roster extends LightningElement {

    @wire(getRoster)
    pitchers;
}