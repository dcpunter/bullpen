/**
 * Applicaiton specific Selector base class, customise fflib_SObjectSelector and add common behaviour
 **/
public inherited sharing abstract class ApplicationSelector extends fflib_SObjectSelector {

    public ApplicationSelector() {
        this(false);
    }
    
    public ApplicationSelector(Boolean includeFieldSetFields) {
        // Disable the base class read security checking in preference to explicit checking elsewhere        
        this(includeFieldSetFields, false, false);
    }
    
    public ApplicationSelector(Boolean includeFieldSetFields, Boolean enforceCRUD, Boolean enforceFLS) {
        // Disable sorting of selected fields to aid debugging (performance optimisation)
        super(includeFieldSetFields, enforceCRUD, enforceFLS, false);
    }
}
