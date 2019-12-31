public inherited sharing class Batters extends ApplicationDomain {

    public Batters(List<Batter__c> batters) {
        super(batters);
    }

    
    public void calculateCount(fflib_ISObjectUnitOfWork uow) {

        for (Batter__c batter : (List<Batter__c>)Records) {
            batter.Count_Strikes__c = 0;
            batter.Count_Balls__c = 0;
            for (Pitch__c pitch : batter.pitches__r) {
                Pitch_Type__c pitchType = pitch.Type__r;
                if (pitch.Is_Strike__c) {
                    if (batter.Count_Strikes__c == 2 && pitchType.Name == 'Foul Ball') {
                        //don't increase count
                        //don't increase count
                    }
                    else {
                        batter.Count_Strikes__c++;
                    }
                    if (pitchType.Name == 'Foul Ball Caught') {
                        batter.Outcome__c = 'Put Out';
                    }
                }
                else {
                    batter.Count_Balls__c++;
                    if (batter.Count_Balls__c == 4) {
                        batter.Outcome__c = 'Walk';
                    }
                }
                
            }
            uow.registerDirty(batter);
        }

    }

    public void calculateCount() {

        fflib_ISObjectUnitOfWork uow = Application.UnitOfWork.newInstance();

        this.calculateCount(uow);

        uow.commitWork();
    }
}
