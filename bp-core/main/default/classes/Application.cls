public class Application {
    
	// Configure and create the UnitOfWorkFactory for this Application
	public static final fflib_Application.UnitOfWorkFactory UnitOfWork = 
		new fflib_Application.UnitOfWorkFactory(
				new List<SObjectType> { 
					Pitcher__c.SObjectType, 
					Game__c.SObjectType, 
				  	Outing__c.SObjectType, 
				  	Batter__c.SObjectType,
                    Pitch__c.SObjectType });
    
    /**
     * Utility method to throw Application exceptions to Lightning Components
     **/
    public static void throwAuraHandledException(Exception e) {
        String message = e.getMessage();
        AuraHandledException error = new AuraHandledException(message);
        error.setMessage(message); // Ensure Apex tests can assert the error message value
        throw error;
    }
}