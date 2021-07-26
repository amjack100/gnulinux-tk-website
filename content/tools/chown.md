---
title: "chown"
date: 2021-07-20T08:28:02-04:00
draft: true
---

`chown` is a tool for changing the owner of a file or directory. To
see the owner of file.txt, use the command `ls -l file.txt`. The output is:

<pre>
-rw-rw-r-- 1 <b>john</b> staff 23 Jul 2 08:45 file.txt
</pre>

where "john" is the file's owner.
`chown` is also capable of changing the file group, (in this case "staff"),
doing the exact same thing as `chgrp`.

## Most Common Usages

Change the owner of a file.

```sh
chown root ./file.txt
```

Change the owner and group of a file.

```sh
chown root:staff ./file.txt
```

Change the owner (and subfiles) of a directory

```sh
chown -hR root directory
```


## Configuration

N/A

