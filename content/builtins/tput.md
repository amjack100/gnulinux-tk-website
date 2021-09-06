---
title: "tput"
date: 2021-07-15T12:09:27-04:00
draft: true
---

`tput` will output a special value from the terminfo database, given a
"capname" as a key. The terminfo database is a set of key value pairs storing
information about hundreds of terminals (+ terminal emulators, given that
actual terminals hardly exist today). Terminfo database files are held in /etc/terminfo/
but are compressed and require special tools for reading.

## Usage Examples

Write the value of a capname to standard output

```bash
$ tput bold
```

Given the argument "bold", `tput` will fetch the value from the terminfo database.

If the name of the user's current terminal is "alacritty", for example,
`tput` will request "bold" from the file /etc/terminfo/a/alacritty, the value
of which is the ansi escape sequence "\E[1m". The text on the user's terminal
will now be bolded.

Embed in a script

```bash
$ echo "$(tput bold)Hello$(tput sgr0)"
```

...which will print a bolded "Hello" to the user's terminal.

## Notes

- The command `infocmp` can be used to show contents of the terminfo
  database of the active terminal in a human readable format.
