public inherited sharing class BattersSelector extends ApplicationSelector {
    public BattersSelector() {

    }

    public List<Batter__c> selectById(Set<Id> batterIds) {
        return (List<Batter__c>)
            selectSObjectsById(batterIds);
    }

	public List<Batter__c> selectByIdWithPitches(Set<Id> batterIds) {
	    fflib_QueryFactory battersQueryFactory = newQueryFactory();
	    fflib_QueryFactory pitchesSubQueryFactory = new PitchesSelector().addQueryFactorySubselect(battersQueryFactory); 	    
        return (List<Batter__c>) Database.query(
            battersQueryFactory.setCondition('Id in :batterIds').toSOQL());
	}

    public List<Batter__c> selectByIdWithPitchesWithPitchType(Set<Id> batterIds) {
	    fflib_QueryFactory battersQueryFactory = newQueryFactory();  
        fflib_QueryFactory pitchesSubQueryFactory = new PitchesSelector().addQueryFactorySubselect(battersQueryFactory);  
        new PitchTypesSelector().configureQueryFactoryFields(pitchesSubQueryFactory, Pitch__c.Type__c.getDescribe().getRelationshipName());
    
        return (List<Batter__c>) Database.query(
            battersQueryFactory.setCondition('Id in :batterIds').toSOQL());
    }

    public List<Batter__c> selectByOuting(Set<Id> outingIds) {
        return (List<Batter__c>)
            Database.query(
                newQueryFactory().
                setCondition('Outing__c in :outingIds').
                toSOQL());
    }

    public List<Batter__c> selectByOutingWithPitches(Set<Id> outingIds) {
        fflib_QueryFactory battersQueryFactory = newQueryFactory();
        fflib_QueryFactory pitchesSubQueryFactory = new PitchesSelector().addQueryFactorySubselect(battersQueryFactory);
        return (List<Batter__c>) Database.query(
            battersQueryFactory.setCondition('Outing__c in :outingIds').toSOQL());
    }

    public List<Schema.SObjectField> getSObjectFieldList() {
        return new List<Schema.SObjectField> {
            Batter__c.Id,
            Batter__c.Name,
            Batter__c.Outing__c,
            Batter__c.Pitches_Thrown__c,
            Batter__c.Strikes_Thrown__c,
            Batter__c.Balls_Thrown__c,
            Batter__c.Outcome__c
        };
    }

    public Schema.SObjectType getSObjectType() {
        return Batter__c.sObjectType;    
    }    
}
