---
title: "basename | dirname"
date: 2021-08-16T19:59:54-04:00
---

`basename` and `dirname` are commands for splitting a directory-file string like
_/home/user/file.txt_ into its individual directory and file components. These
are useful shortcuts for what might otherwise be overly complex `sed`
expressions.

## Usage Examples

Get the basename of a full filename.

{{< showIfExists "static/basename.svg" >}}

Get the basename of a full filename without the extension.

```bash
$ basename /home/user/file.txt .txt
file
```

Extract the dirname of a full filename.

```bash
$ dirname /home/user/filename.txt
/home/user
```

## Notes

- Both `basename` and `dirname` will work as expected when given multiple
  filename arguments.
