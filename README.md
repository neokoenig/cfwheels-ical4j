# cfwheels-ical4j

CFWheels Plugin Date Repeats Methods via iCal4J Java Lib

Use to create repeating date ranges against the iCal standard; Note this plugin doesn't try to be an entire iCal wrapper - this is just to get the RRULE logic.

## Useage

```
// Get array of dates
myDates = getRecurringDates(
		     pattern="RRULE:FREQ=MONTHLY;INTERVAL=2;BYMONTHDAY=2",
		     seed="2017-03-27 10:00:00",
		     from="2017-03-27 10:00:00",
		     to="2017-03-27 10:00:00");
```

See `tests/ICal4J.cfc` for more examples

## Requirements

- Requires wheels 2.x which loads Java libs dynamically for plugins
- You could backport to 1.4 by manually adding `plugins/ical4j` to your `this.javaSettings.Loadpaths`
