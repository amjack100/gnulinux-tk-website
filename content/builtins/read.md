---
title: "read"
date: 2021-09-28T16:31:11-04:00
---

`read` is used for getting data from standard input. In used within a script,
`read` will pause the script, wait for the user to type a string of characters,
and then store that text in a variable.

## Usage Examples

Read input typed from the keyboard (with a prompt).

{{< showIfExists "static/read.svg" >}}

<br>

When the user enters their name and presses enter, that data will be stored in
the variable _name_.

Read input typed from the keyboard (without a prompt).

```bash
$ read variable
```

Continuously read and perform an action on every line.

```bash
$ while read line; do echo "$line";done
```

## Notes

- By default, `read` will display the keys to the terminal as they are typed. To
  avoid this, use `read -s` for silent mode.
