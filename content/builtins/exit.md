---
title: "exit"
date: 2021-09-30T08:20:02-04:00
---

`exit` is used for quitting an interactive shell, or, if used inside a script,
quitting that script.

## Usage Examples

Exit the shell.

```bash
$ exit
```

Exit the shell with a "success" exit status.

```bash
$ exit 0
```

Exit the shell with a "failure" exit status.

```bash
$ exit 1
```

## Notes

- An _exit status_ is used to communicate how a program/script ended. 0 is
  _success_ and any positive number 1-255 is _failure_. This allows different
  numbers to mean different types of failure, which is more useful than having
  different types of success. <br>

- For example, `grep` exits with 0 if it runs normally, 1 if no matches were
  found, and 2 if there are syntax errors, etc.
