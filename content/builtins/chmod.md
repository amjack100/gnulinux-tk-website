---
title: "chmod"
date: 2021-07-18T07:25:34-04:00
---

`chmod` is a utility for **ch**anging the **mod**e (permissions) of a file or
directory. A file's mode defines who can read, write, and execute it. To check
the mode of a file _file.txt_, use the command `ls -l file.txt`. The output
is...

<pre>
<b>-rw-rw-r--</b> 1 user group 23 Jul 2 08:45 file.txt
</pre>

...where `-rw-rw-r--` is the file's mode.

The first dash is the type of file. The next 9 dashes are mode bits. A letter
(r,w,x) means on and a dash means off. <br>

## Usage Examples

Allow a file to be executed by everyone.

```bash
$ chmod +x file.txt
# same as chmod a+x file.txt
```

Give specific permissions to specific people.

```bash
$ chmod u=rwx file.txt
# u (user), g (group), o (other), or a (all)
```

Assign permissions to a file using octal values

```bash
$ chmod 777 file.txt
# same as chmod +rwx
```

## Notes

Octal value permissions can be translated with the following table:

| #   | Permissions     | Label  |
| --- | --------------- | ------ |
| 0   | None            | \-\-\- |
| 1   | Execute         | -\-x   |
| 2   | Write           | -w-    |
| 3   | Execute & Write | -wx    |
| 4   | Read            | r-\-   |
| 5   | Read & Execute  | r-x    |
| 6   | Read & Write    | rw-    |
| 7   | All             | rwx    |

Notice how _execute (1)_ + _write (2)_ = 3, _execute (1)_ + _read (4)_ = 5, etc.
See [octal modes](https://en.wikipedia.org/wiki/Chmod) on Wikipedia.
