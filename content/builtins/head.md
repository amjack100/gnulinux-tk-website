---
title: "head | tail"
date: 2021-08-19T11:20:41-04:00
draft: true
---

`head` and `tail` are a pair of commands which will
allow one to preview a several lines of a file (10, by default),
starting from the file's beginning or end. Their functionalities are
very similar to the `cat` command. See [cat]({{< ref "builtins/cat.md" >}})
<br>
<br>
These utilities are very useful for getting a quick reminder of a
file's contents, as well as watching a file for real-time updates.

## Usage Examples

Preview the first 10 lines of a file.

```bash
$ head file.txt
```

Preview the last 10 lines of a file.

```bash
$ tail file.txt
```

Watch the end of a file as it is continuously updated.

```bash
$ tail -f /var/log/syslog
```
