import { LightningElement, api } from 'lwc';

export default class Pitcher extends LightningElement {

    @api
    id;
    @api
    name;
    @api
    throws;

    get pitcherStyle() {
        return this.selected===true ? 'slds-tile_board active' : 'slds-tile_board'
    }

    pitcherClicked() {
        this.dispatchEvent(new CustomEvent('select', { detail: this.id }));
    }
}