public inherited sharing class PitchersSelector extends ApplicationSelector  {
    public PitchersSelector() {

    }

    public List<Pitcher__c> selectById(Set<Id> pitcherIds) {
        return (List<Pitcher__c>)selectSObjectsById(pitcherIds);
    }

    public List<Pitcher__c> selectAll() {
        return (List<Pitcher__c>)Database.query(newQueryFactory().toSOQL());
    }

    public List<Schema.SObjectField> getSObjectFieldList() {
        return new List<Schema.SObjectField> {
            Pitcher__c.Id,
            Pitcher__c.Name,
            Pitcher__c.Throws__c
        };
    }

    public Schema.SObjectType getSObjectType() {
        return Pitcher__c.sObjectType;
    }
}