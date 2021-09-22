---
title: "chown"
date: 2021-07-20T08:28:02-04:00
---

`chown` is a tool for changing the owner of a file or directory. To reveal the
owner of a file _file.txt_, use the command `ls -l file.txt`. The output is...

<pre>
-rw-rw-r-- 1 <b>john</b> staff 23 Jul 2 08:45 file.txt
</pre>

...where _john_ is the file's owner. `chown` is also capable of changing the
file group, ( _staff_ ), having the same functionality as `chgrp`.

## Usage Examples

Change a file's owner.

```bash
$ chown root ./file.txt
```

Change a file's owner and group.

```bash
$ chown root:staff ./file.txt
```

Change the owner of a directory and its contents recursively.

```bash
$ chown -hR root directory
```
