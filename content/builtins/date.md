---
title: "date"
date: 2021-08-17T08:29:12-04:00
---

`date` gets the current date and time. `date` is especially useful for long
running tasks like logging. <br><br> The output of `date`can be formatted using
combinations of a wide range of formatting sequences.

## Usage Examples

Get the current date in the default format

{{< showIfExists "static/date.svg" >}}

`date` with no arguments is equal to `date +%c`

Log an event with date annotations

```bash
$ echo "[$(date +%F_%T)] Some event occured" >> log.txt
# Output: [2021-08-17_10:35:07] Some event occured
```

## Notes

The following format sequences describe how the output of `date` can be adjusted
to look a specific way. A sequence is a "%" followed by a single letter. The
different letters produce output based on whether they are lowercase or
uppercase, for example `%a` or `%A`, where the uppercase member will typically
expand into a longer/more verbose descriptor.

<style>
table {
width:100%
}
</style>

| Character |        Description |                         Example |
| --------- | -----------------: | ------------------------------: |
| %a %A     |                    |                     Tue Tuesday |
| %b %B     |                    |                      Aug August |
| %c        |                    | Tue 17 Aug 2021 09:16:13 AM EDT |
| %C        |            Century |                              20 |
| %d        |   Day of the month |                              17 |
| %D        |           %m/%d/%y |                        08/17/21 |
| %e        |               %\_d |                              17 |
| %F        |          Full date |                      2021-08-17 |
| %g %G     |  Year of ISO week# |                         2021 21 |
| %h        |                 %b |                             Aug |
| %H        |          Hour 0-24 |                              22 |
| %I        |          Hour 1-12 |                              10 |
| %j        |        Day of year |                             229 |
| %k        |               %\_H |                              22 |
| %l        |               %\_I |                              10 |
| %m        |        Month 01-12 |                              08 |
| %M        |       Minute 00-59 |                              13 |
| %n        |          A newline |
| %N        |        Nanoseconds |                       263121241 |
| %p %P     |              AM/PM |                           AM am |
| %q        |    Quarter of year |                               3 |
| %r        |      12-hour clock |                     10:16:21 AM |
| %R        |      24-hour clock |                           10:16 |
| %s        |          Seconds\* |                      1629209907 |
| %S        |       Second 00-60 |                              11 |
| %t        |              A tab |
| %T        |               Time |                        10:16:21 |
| %u        |    Day of week 1-7 |                               2 |
| %U        |     Week # of year |                              33 |
| %V        |   ISO week # 01-53 |                              33 |
| %w        |    Day of week 0-6 |                               2 |
| %W        |     Week # of year |                              33 |
| %x        |        Locale date |                      08/17/2021 |
| %X        |        Locale time |                     10:25:19 AM |
| %y        | Year last 2 digits |                              21 |
| %z        |    +hhmm time zone |                           -0400 |
| %Z        |    Time zone abbr. |                             EDT |
