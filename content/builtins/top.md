---
title: "top"
date: 2021-09-02T20:19:02-04:00
draft: true
---

`top` is an interactive program for monitoring processes, cpu usage and live feeds
of other system metrics. `top` stands for **t**able **o**f **p**rocesses. Effectively
using this tool requires some practice compared to other commands, as its interactive
menu provides many options and the ability to filter specific items.

## Basic Functionality

Simply start `top`.

```bash
$ top
```

Start `top`, sorting processes by a particular field.

```bash
$ top -o name_of_field
```

## Workflows

While the interactive table is running within your terminal, many keyboard shortcuts
become available which provide additional functionality. You can type `?` to quickly
view help for these commands.

### Filtering processes

One of the most powerful of these commands is called with the `o/O` key, which allows
you to enter a filter for picking out specific processes based on PID, Command Name/Line,
etc. For example, pressing `o` will trigger the filter prompt...

```txt
add filter #1 (ignoring case) as: [!]FLD?VAL
```

and then typing...

```txt
add filter #1 (ignoring case) as: [!]FLD?VAL COMMAND=pythonscript.py
```

...will allow you to closely monitor a script, say _pythonscript.py_ which you
may be suspecting of hoarding memory.
<br>

Press `f/F` to see a list of all the available filters alongside brief explanations
of what they do.

### Increasing/descreaing update speed

One can press either `d` or `s` to open the "update interval prompt". Lower inputs
will cause `top` to refresh the process table more quickly, while higher numbers
will slow the refresh rate.
