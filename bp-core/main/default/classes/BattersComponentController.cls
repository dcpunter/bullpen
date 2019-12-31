public with sharing class BattersComponentController {
    public BattersComponentController() {

    }

    @AuraEnabled(cacheable=true)
    public static List<Batter__c> getBatters(Id outingId){
        return new BattersSelector().selectByOuting(new Set<Id> {outingId});
    }
}
