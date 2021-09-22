---
title: "infocmp"
date: 2021-09-22T10:51:45-04:00
---

`infocmp` is a command used for printing out descriptions from the _terminfo_
database, a database which contains terminal descriptions and data. The **cmp**
in `infocmp` refers to the tool's ability to **compare** data values across
different terminals.

_Note: for brevity, "terminal" and "terminal emulator" are interchangeable._

## Usage Examples

Get _terminfo_ data values corresponding to the current terminal.

```bash
$ infocmp
```

{{< showIfExists "static/infocmp.svg" >}}

Get shared (common) data values between two terminals.

```bash
$ infocmp -c alacritty xterm
```

Get differing data values across two terminals.

```bash
$ infocmp -d alacritty xterm
```

## Notes

- The actual on-disk location of the terminfo database is provided in the first
  line of output, which will be similar to:

  ```txt
  #     Reconstructed via infocmp from file: /usr/share/terminfo/a/alacritty
  ```

- See more about the
  [terminfo database](https://en.wikipedia.org/wiki/Terminfo).
