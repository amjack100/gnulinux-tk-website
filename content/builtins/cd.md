---
title: "cd"
date: 2021-08-17T19:39:28-04:00
---

`cd` is a command used for setting the current working directory - it is one of
the most frequently used commands. `cd` stands for **c**hange **d**irectory.

## Usage Examples

Set the current working directory to (go to) a new location.

```bash
$ cd directory
```

Go to the home directory.

```bash
$ cd ~
# or just cd
```

Go to the previous directory.

```bash
$ cd -
```

Go up a directory.

```bash
$ cd ..
# or multiple: cd ../../..
```

## Notes:

- `cd` also exists in most other operating systems such as Microsoft Windows as
  the same name.
- The system call equivalent to `cd` is `chdir()`.
- Every process that exists has a current working directory. Also, see
  [pwd]({{< ref "builtins/pwd.md" >}}).
