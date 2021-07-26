---
title: "sed"
date: 2021-07-25T08:27:22-04:00
draft: true
---

`sed` is a tool for editing text. It is a **s**tream **ed**itor, meaning it can
accomplish the same tasks as a traditional text editor by iterating through streams
of text with commands.

## Most Common Usages

The 's' (substitute) command is the most important `sed` command.
<br>
Preview replacement of all matching patterns in a file.

```sh
sed 's/old/new' file.txt
```

Write replacement of all matching patterns in a file.

```sh
sed -i 's/old/new' file.txt
```

## Configuration

N/A
