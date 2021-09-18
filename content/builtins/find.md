---
title: "find"
date: 2021-07-26T12:14:15-04:00
---

`find` is the primary built-in utility for finding files on a GNU/Linux system.

## Usage Examples

_The first 2 examples begin searching from the current working directory._

Find files that match a search pattern

```bash
$ find -iname '*.txt'
```

`-iname` means "case insensitive", which can in general be more helpful than
`-name`.

Find files that have been modified within a specific time frame

```bash
$ find -cmin -20
```

Where the last modified time is 20 minutes

Find every file on the entire system which matches a search pattern

```bash
$ sudo find / -iname 'filename*'
```

## Configuration

Minor configuration options can be specified with environment variables. See the
`find` man page for more specific details.

## Notes

- `find` is frequently with `xargs`, especially within scripts.
