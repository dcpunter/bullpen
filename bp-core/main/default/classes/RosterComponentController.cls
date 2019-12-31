public with sharing class RosterComponentController {

    @AuraEnabled(cacheable=true)
    public static List<Pitcher__c> getRoster() {
        return new PitchersSelector().selectAll();
    }
}