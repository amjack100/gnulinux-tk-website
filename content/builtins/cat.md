---
title: "cat | tac"
date: 2021-07-31T09:01:26-04:00
---

`cat` is a tool for con**cat**entaing files, although its most frequent use
involves simply displaying file content to the terminal. `tac` does the exact
same thing, except lines are output in reverse order.

## Usage Examples

View the contents of a file.

```bash
$ cat file.txt
```

Send the contents of a file to a new file.

```bash
$ cat file.txt > newfile.txt
```

Append the contents of a file to the end of an existing file.

```bash
$ cat file.txt >> existingfile.txt
```

Prepend the contents of a file to the start of an existing file.

```bash
$ cat first.txt second.txt > newfile.txt
```
