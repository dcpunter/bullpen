public inherited sharing class Pitches extends ApplicationDomain {

    public Pitches(List<Pitch__c> pitches) {
        super(pitches);
    }

    public override void onApplyDefaults(){

        Set<Id> pitchTypeIds = new Set<Id>();

        for (Pitch__c pitch : (List<Pitch__c>)Records) {
            pitchTypeIds.add(pitch.type__c);
        }

        Map<Id, Pitch_Type__c> associatedPitchTypes = new Map<Id, Pitch_Type__c>(new PitchTypesSelector().selectById(pitchTypeIds));

        for (Pitch__c pitch : (List<Pitch__c>)Records) {
            pitch.Is_Strike__c = associatedPitchTypes.get(pitch.type__c).Is_Strike__c;
        } 
    }

    public override void onValidate() {

        Map<Id, Batter__c> associatedBatters = new Map<Id, Batter__c>(this.queryAssociatedBatters((List<Pitch__c>)Records));

        for (Pitch__c pitch : (List<Pitch__c>)Records) {
            if (associatedBatters.get(pitch.batter__c).outcome__c != 'At Bat') {
                //raise error
                pitch.addError( 'Pitches can only be added to those currently at bat');		
            }
        }            
    }

    public override void onAfterInsert() {

		// Bulk load the associated batters
		Set<Id> batterIds = new Set<Id>();
		for(Pitch__c pitch : (List<Pitch__c>)Records) {
            batterIds.add(pitch.Batter__c);		    
		}			

        fflib_ISObjectUnitOfWork uow = Application.UnitOfWork.newInstance();

        Batters batters = new Batters(new BattersSelector().selectByIdWithPitchesWithPitchType(batterIds));
        batters.calculateCount(uow);

        uow.commitWork();
        
    }

	private List<Batter__c> queryAssociatedBatters(List<Pitch__c> pitches) {
		// Bulk load the associated batters
		Set<Id> batterIds = new Set<Id>();
		for(Pitch__c pitch : pitches) {
            batterIds.add(pitch.Batter__c);		    
		}			
		return new BattersSelector().selectById(batterIds);		
	}    

	public class Constructor implements fflib_SObjectDomain.IConstructable {
		public fflib_SObjectDomain construct(List<SObject> sObjectList) {
			return new Pitches(sObjectList);
		}
	}	    
}
