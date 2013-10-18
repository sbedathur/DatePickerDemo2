public with sharing class DatePickerDemo2Controller {

    // the soql without the order and limit
    private String soql {get;set;}

    // format the soql for display on the visualforce page
    public String soqlQuery {
        get { return soql + ' order by name asc'; }
        set;
    }
    
    // init the controller and build the default query string
    public DatePickerDemo2Controller() {
        soql = 'select Id, Name, Start_Date__c, End_Date__c, Location__c, Description__c, IsActive__c from Special_Event__c where IsActive__c = true';
    }

    // builds the query using parameters passed via Javascript
    public PageReference buildQueryString() {
 
        String name = Apexpages.currentPage().getParameters().get('name');
        String event_start_date_from = Apexpages.currentPage().getParameters().get('event_start_date_from_alternate');
        String event_start_date_to = Apexpages.currentPage().getParameters().get('event_start_date_to_alternate');
        
        soql = 'select Id, Name, Start_Date__c, End_Date__c, Location__c, Description__c, IsActive__c from Special_Event__c where IsActive__c = true';
        
        if (!name.equals(''))
            soql += ' and name LIKE \'%'+String.escapeSingleQuotes(name)+'%\'';
        if (!event_start_date_from.equals(''))
            soql += ' and start_date__c >= ' +String.escapeSingleQuotes(event_start_date_from)+ ' ';     
        if (event_start_date_to != null && !event_start_date_to.equals(''))
            soql += ' and start_date__c <= ' +String.escapeSingleQuotes(event_start_date_to)+ ' ';     
             
        return null;
    }
    
}
