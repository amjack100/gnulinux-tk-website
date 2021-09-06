---
title: "ln"
date: 2021-07-22T07:50:03-04:00
draft: true
---

`ln` is a tool for creating **l**i**n**ks between files. It can create the two different
types of links: soft/symbolic links and hard links. A soft link is like the
equivalent of a Windows shortcut icon. When a program reads a soft link, it
is redirected to where the file is. A hard link is basically like giving a
file another name. When a program reads a hard link, it reads the exact data block
as the original file.

## Usage Examples

Create a soft link to a file

```bash
$ ln -s file.txt s-link.txt
```

Create a hard link to a file

```bash
$ ln -T file.txt h-link.txt
```

(T stands for target)

Create a soft link to a directory

```bash
$ ln -sd directory s-link-directory
```

## Notes

- Creating a hard link for a directory can [break the filesystem](https://askubuntu.com/questions/210741/why-are-hard-links-not-allowed-for-directories)
and is therefore usually made impossible with system restrictions

