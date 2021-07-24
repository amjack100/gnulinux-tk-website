---
title: "chmod"
date: 2021-07-18T07:25:34-04:00
draft: true
---

`chmod` is a utility for **ch**anging the **mod**e (permissions) of a file or
directory. To check the file mode for file.txt, use the command `ls -l file.txt`.
The output is:

<pre>
<b>-rw-rw-r--</b> 1 user group 23 Jul 2 08:45 file.txt
</pre>

where `-rw-rw-r--` is the file's mode.

The first dash is the type of file and is not important.
The next 9 dashes are mode bits. A letter (r,w,x) means on and a dash means off.
<br>
See [octal modes](https://en.wikipedia.org/wiki/Chmod) on wikipedia.

## Most Common Usages

Allow a file to be executed by everyone.

```sh
chmod a+x file.txt # or chmod +x file.txt 
```

Give specific permissions to specific people.

```sh
chmod u=rwx
```

where u (user) could be g (group), o (other), or a (all).

## Configuration

N/A
