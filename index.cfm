<h1>iCal4J</h1>
<p>A quick cfwheels plugin wrapper for iCal4J: use to create repeating date ranges against the iCal standard; Note this plugin doesn't try to be an entire iCal wrapper - this is just to get the RRULE logic.</p>
<h4>Usage</h4>
<pre>
<code>
// Get array of dates
 myDates = getRecurringDates(
		     pattern="RRULE:FREQ=MONTHLY;INTERVAL=2;BYMONTHDAY=2",
		     seed="2017-03-27 10:00:00",
		     from="2017-03-27 10:00:00",
		     to="2017-03-27 10:00:00");
</code>
</pre>
<p>See <code>tests/ICal4J.cfc</code> for more examples</p>
<h5>Requirements</h5>
<ul>
	<li>Requires wheels 2.x which loads Java libs dynamically for plugins</li>
	<li>You could backport to 1.4 by manually adding <code>plugins/ical4j</code> to your <code>this.javaSettings.Loadpaths</code></li>
</ul>
