---
title: "clear"
date: 2021-09-21T19:14:24-04:00
---

`clear` is a command used for erasing the visible text on the terminal screen.
In the _bash_ shell `clear` is bound to _Ctrl-L_.

## Usage Examples

{{< showIfExists "static/clear.svg" >}}

Clear the terminal.

```bash
$ clear
```

## Notes

_How it works_: `clear` asks the _terminfo_ database for the appropriate escape
sequence corresponding to the user's terminal. We can find this escape sequence
with...

```bash
$ infocmp | grep clear

clear=\E[H\E[2J, cnorm=\E[?12l\E[?25h, cr=\r,
```

The output will differ across terminal emulators (in this case it is alacritty).
<br><br> Now, note that entering...

```bash
$ echo -e "\E[H\E[2J"
```

...into the alacritty terminal emulator acts identical to `clear`.
