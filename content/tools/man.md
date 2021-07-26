---
title: "man"
date: 2021-07-14T08:06:58-04:00
draft: true
---

`man` is used to display user **man**uals typical stored in /usr/share/man
. Manuals are divided into these sections:

1. User commands and tools
2. Linux system calls
3. Library functions (system call wrappers) which implement system calls
4. Special files (devices)
5. File formats and corresponding C structures (if any)
6. "Games and funny little programs"
7. Miscellaneous
8. Administration and privileged commands
9. Kernel routines [Non standard]

Use `man <number> intro` to read more about each section (except 9).

## Most Common Usages

Open the manual of a program.

```sh
man mkdir 
```

Open the specific section of a program's manual.

```sh
man 2 mkdir
```

Regex search the names of all manuals.

```sh
man -k mk
```

Show the available sections of a program's manual.

```sh
man -f mkdir
```

Get the actual location of a manual page.

```sh
man -w mkdir
```

## Configuration

See manpath configuration

## Notes

[The history of UNIX Manpages](https://manpages.bsd.lv/history.html)
