public inherited sharing class PitchesSelector extends ApplicationSelector {
    public PitchesSelector() {

    }

    public List<Pitch__c> selectById(Set<ID> pitchIds) {
        return (List<Pitch__c>)
            selectSObjectsById(pitchIds);
    }

    public List<Pitch__c> selectByIdWithPitchType(Set<ID> pitchIds) {
	    fflib_QueryFactory pitchesQueryFactory = newQueryFactory();

        new PitchTypesSelector().configureQueryFactoryFields(pitchesQueryFactory, Pitch__c.Type__c.getDescribe().getRelationshipName());

        return Database.query(pitchesQueryFactory.setCondition('Id in :pitchIds').toSOQL());
    }

    public List<Pitch__c> selectByBatter(Set<ID> batterIds) {
        return (List<Pitch__c>)
            Database.query(
                newQueryFactory().
                setCondition('Batter__c in :batterIds').
                toSOQL());
    }

    public List<Schema.SObjectField> getSObjectFieldList() {
        return new List<Schema.SObjectField> {
            Pitch__c.Id,
            Pitch__c.Name,
            Pitch__c.Is_Strike__c,
            Pitch__c.Batter__c,
            Pitch__c.Type__c
        };
    }

    public Schema.SObjectType getSObjectType() {
        return Pitch__c.sObjectType;    
    }
}