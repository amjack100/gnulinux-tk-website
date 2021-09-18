---
title: "diff"
date: 2021-08-28T15:27:40-04:00
---

`diff` is a command for comparing files line by line. `diff` provides multiple
output formats, making it useful as a command line tool as well as a scripting
tool. The most common use case involves displaying changes of the same file
across multiple versions.

## Usage Examples

Compare two files.

_~/one.txt_

```txt
one
two
three
```

_~/two.txt_

```txt
one
two
four
```

```bash
$ diff ~/one.txt ~/two.txt

3c3
< three
---
> four
```
