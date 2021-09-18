---
title: "tset | reset"
date: 2021-08-14T09:09:21-04:00
---

`tset` and `reset` are historical commands used to reset an actual text-based
terminal (as opposed to a _terminal emulator_ running on a graphics-oriented
system).

## Usage Examples

Initialize a terminal.

```bash
$ tset
```

Reinitialize a terminal.

```bash
$ reset
```

## Configuration

- The _SHELL_ environment variable provides a syntax specification.
- The _TERM_ environment variable denotes terminal type.
- The _TERMCAP_ environment variable denotes the location of the _termcap_
  database. See `tput` for further information.

## Notes

- `tset`/`reset` have under-documented features and were made obsolete by the
  `tput` utility. However, as of 2021, they still exist as callable programs on
  many systems.
