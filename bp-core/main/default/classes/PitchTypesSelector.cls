public inherited sharing class PitchTypesSelector extends fflib_SObjectSelector  {
    public PitchTypesSelector() {

    }

    public List<Pitch_Type__c> selectById(Set<Id> pitchTypeIds) {
        return (List<Pitch_Type__c>)selectSObjectsById(pitchTypeIds);
    }

    public List<Schema.SObjectField> getSObjectFieldList() {
        return new List<Schema.SObjectField> {
            Pitch_Type__c.Id,
            Pitch_Type__c.Name,
            Pitch_Type__c.Is_Strike__c
        };
    }

    public Schema.SObjectType getSObjectType() {
        return Pitch_Type__c.sObjectType;
    }
}
