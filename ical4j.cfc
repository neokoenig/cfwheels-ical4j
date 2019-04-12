component hint="iCal4J" output="false" mixin="controller,model"
{
	public function init() {
		this.version = "2.0,2.1";
		return this;
	}

	/**
	* Given a iCal style repeat rule, a seed date and a from-to range, get all recurring dates which satisfy those conditions
	* Requires request scope obs
	*
	* [section: Plugins]
	* [category: Calendaring]
	*
	* @pattern The ical RRULE style string
	* @seed The seed date
	* @from When to generate repeat range from
	* @to When to generate repeat range till
	**/
	public array function getRecurringDates(required string pattern, required date seed, date from, date to){

		if(!structKeyExists(request, "recurObj"))
			request.recurObj 		= CreateObject( "java", "net.fortuna.ical4j.model.Recur" ).init();

		if(!structKeyExists(request, "valueObj"))
			request.valueObj 		= CreateObject( "java", "net.fortuna.ical4j.model.parameter.Value" ).init("DATE");

	    local.pattern = arguments.pattern;
        local.patternStruct = $constructStructFromString(local.pattern);

        // Reset
        request.recurObj.setFrequency(local.patternStruct.freq);

    	request.recurObj.getDayList().clear();
	    request.recurObj.setInterval(1);
        request.recurObj.setCount( 0 );

        if(structKeyExists(local.patternStruct, "until"))
            request.recurObj.setUntil( CreateObject( "java", "net.fortuna.ical4j.model.DateTime" ).init(local.patternStruct.until) );

        if(structKeyExists(local.patternStruct, "interval"))
            request.recurObj.setInterval( local.patternStruct.interval );

        if(structKeyExists(local.patternStruct, "count"))
            request.recurObj.setCount( local.patternStruct.count );

        if(structKeyExists(local.patternStruct, "byday")){
        	for( var d in local.patternStruct.byday){
        		request.recurObj.getDayList().add(
        			CreateObject( "java", "net.fortuna.ical4j.model.WeekDay" ).init(d)
        		);
        	}
        }


        local.seed = CreateObject( "java", "net.fortuna.ical4j.model.DateTime" ).init(arguments.seed);
        local.from = CreateObject( "java", "net.fortuna.ical4j.model.DateTime" ).init(arguments.from);
        local.to = CreateObject( "java", "net.fortuna.ical4j.model.DateTime" ).init(arguments.to);

        local.rv = request.recurObj.getDates(
            local.seed,
            local.from,
            local.to,
            request.valueObj
        );
        return local.rv;
	}

	/**
	* Internal Function
	**/
	 struct function $constructStructFromString(required string){
        local.rv = {};
        local.arr = listToArray(arguments.string, ';');
        for(local.a in local.arr){
            var label = listFirst(local.a, "=");
            var value = listLast(local.a, "=");
            local.rv[label] = value;
        }
        return local.rv;
    }
}
