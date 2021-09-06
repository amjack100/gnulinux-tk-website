---
title: "grep"
date: 2021-08-06T11:52:52-04:00
draft: true
---

`grep` is a very commonly used tool for searching for patterns of text within
files or an output stream. `grep` stands for **g**lobal **r**egular
**e**xpression **p**rint. This comes from the `sed`/`ed` subcommand
**_g/re/p_**, where _g_ and _p_ are the _global_ and _print_ flags, and re is a
regular expression.

## Basic Functionality

Search a single file for a matching pattern.

```bash
$ cat file.txt | grep '.*pattern'
```

Search though files across multiple directories for a matching pattern.

```bash
$ grep nvidia /etc/modprobe.d/* /lib/modprobe.d/*
```

In this case, `grep` will locate all the files in `/etc/modprobe.d` and
`/lib/modprobe.d` containing the word "nvidia", and output the full line of the
file where it occurs.

Search through files & directories recursively for a regex pattern, starting at
the current working directory.

```bash
$ grep 'pattern.*' -r
```

## Workflows

### Search for a fixed string

Searching for a fixed string means that `grep` will interpret its pattern
matching argument as the literal characters it's given, ignoring the concept of
regular expressions completely. <br> For example, given a file _file.txt_ with
the contents...

```txt
apples
apples oranges
apples.*
```

...searching for the fixed string 'apples._' will match literally "apples._",
the third line (and _only_ the third line). The syntax for performing this
example is...

```bash
$ grep -F 'apples.*' ./file.txt
```

This is a contrived example, but there are real world use cases where this sort
of matching can be helpful for files containing an unusual range of characters.
The command `fgrep` performs this same functionality, although its usage is
outdated.
