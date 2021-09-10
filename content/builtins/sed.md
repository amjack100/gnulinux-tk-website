---
title: "sed"
date: 2021-07-25T08:27:22-04:00
draft: true
---

`sed` is a tool for editing text. It is a **s**tream **ed**itor, meaning it can
accomplish the same tasks as a traditional text editor by iterating through
streams of text with commands.

## Overview

The 's' (substitute) command is the most important `sed` command. <br> Preview
replacement of all matching patterns in a file.

```bash
$ sed 's/old/new' file.txt
```

Write replacement of all matching patterns in a file.

```bash
$ sed -i 's/old/new' file.txt
```

## Workflows

The previous examples demonstrate the basic functionality, but are not enough to
expose `sed` as an agile, real world tool. Typically, one would like to
continuously preview and adjust their expressions without dumping the entire
file to the console or modifying the file in place with no confirmation as to
whether or not the desired outcome was achieved.

A practical _find_ & _replace_ workflow might look like this:

1. Confirm that the _find_ pattern exists within the file as expected.
2. Confirm that the _replace_ pattern alters the file as expected.
3. Use `sed -i` to finalize the replacements, optionally with a backup file.
4. Confirm that the output file changed as expected.

In this example, we'll use `sed` to replace all instances of "old" with "new" in
_file.txt_.

### Confirm the desired find pattern

Find all the lines matching the string "old" (basically as `grep` would)

```bash
$ sed -n '/old/p'
```

### Confirm the replace pattern

Using the standard `sed 's/old/new'` will output the entire file with changes in
place, requiring the user to navigate to the location of the expected change in
order to preview it. Instead, one can use...

```bash
$ sed -n 's/old/new/gp' file.txt
```

... in order to only reveal the lines in the file which have been changed.
