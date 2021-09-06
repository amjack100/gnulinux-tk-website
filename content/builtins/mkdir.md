---
title: "mkdir | rmdir"
date: 2021-08-11T14:26:49-04:00
draft: true
---

`mkdir` and `rmdir` are minimal commands for **m**a**k**ing and **r**e**m**oving
**dir**ectories respectively.

## Usage Examples

Make a new directory

```bash
$ mkdir directoryname
```

Create multiple directories as a directory tree

```bash
$ mkdir -p outer/middle/inner
```

Remove an empty directory

```bash
$ rmdir directoryname
```

## Notes

- `mkdir` and `rmdir` are the direct command line equivalents of the `mkdir()`
  and `rmdir()` Linux system calls. One can view `man 2 mkdir` or `man 2 rmdir`
  for more information.

- `rmdir` is particularly different than `rm -r` as it will only remove empty
  directories, providing safer use in many cases.
