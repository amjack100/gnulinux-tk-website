---
title: "basename | dirname"
date: 2021-08-16T19:59:54-04:00
draft: true
---

`basename` and `dirname` are commands for splitting a directory-file string
like _/home/user/file.txt_ into its individual directory and file
components. These are useful shortcuts for what might otherwise be overly
complex `sed` expressions.

## Usage Examples

Extract the basename (and suffix) of a full filename.

<img src="/basename.svg" alt="basename animation"/>

```bash
$ basename /home/user/filename.txt .txt
filename
```

Extract the dirname of a full filename.

```bash
$ dirname /home/user/filename.txt
/home/user
```

## Notes

- Both commands will work as expected when given multiple filename arguments.
