component hint="iCal4J" output="false" mixin="controller"
{
	public function init() {
		this.version = "2.0";
		return this;
	}

	/**
	* Given a iCal style repeat rule, a seed date and a from-to range, get all recurring dates which satisfy those conditions
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
		local.recur = $ical_createRecur(arguments.pattern);
		return local.recur.getDates($ical_createDate(arguments.seed), $ical_createDate(arguments.from), $ical_createDate(arguments.to), $ical_createValue("DATE"));
	}

	/**
	* Internal Function
	**/
	public function $ical_createRecur(required string string){
		local.rv=CreateObject( "java", "net.fortuna.ical4j.model.Recur" ).init(string);
		return local.rv;
	}

	/**
	* Internal Function
	**/
	public function $ical_createDate(required string date){
		return CreateObject( "java", "net.fortuna.ical4j.model.DateTime" ).init(date);
	}

	/**
	* Internal Function
	**/
	public function $ical_createValue(required string value){
		return CreateObject( "java", "net.fortuna.ical4j.model.parameter.Value" ).init(value);
	}
}
