---
title: "cd"
date: 2021-08-17T19:39:28-04:00
---

`cd` allows for **c**hanging **d**irectories, and is easily one of the most
commonly used Linux commands. It has also been implemented in other operating
systems as the exact same command such as Microsoft Windows. `cd` falls in line
with the other _ch\* (change)_ commands, as it is essentially a shortened
version of the system call, `chdir()`.

## Usage Examples

Set the current working directory to (go to) a new location.

```bash
$ cd directory
```

Go to the home directory.

```bash
$ cd ~

# Or simply cd
```

Go to the previous directory.

```bash
$ cd -
```

Go one directory up in the directory tree.

```bash
$ cd ..

# Or up multiple
# cd ../../..
```
