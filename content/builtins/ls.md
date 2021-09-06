---
title: "ls | dir | vdir"
date: 2021-07-28T17:44:52-04:00
draft: true
---

`ls` is short for _list_ and displays the contents of a directory.
<br>
`dir` is equivalent to `ls -C -b`
<br>
`vdir` is equivalent to `ls -l -b`

## Usage Examples

Show the contents of the current directory.

```bash
$ ls
```

Show directory contents, including hidden files.

```bash
$ ls -a
```

Show directory contents and information about each item.

```bash
$ ls -l
```

## Configuration

The output of `ls` can be configured through the `dircolors` command which
modifies the _LS_COLORS_ environment variable.

## Notes

- The first portion of the output from `ls -l` describes file permissions,
  which can be further understood and modified with `chmod`
