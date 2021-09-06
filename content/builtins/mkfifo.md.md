---
title: "mkfifo"
date: 2021-09-04T20:18:34-04:00
draft: true
---

`mkfifo` is used for creating _named pipes_, a special file type.
The name `mkfifo` comes from **m**a**k**e First In First Out, where a first-in
first-out file operates like a pipe but has an identifier and is entered into the
filesystem. Before a FIFO can have input/output performed on it, it must be opened
at both "ends" (opened for reading and opened for writing).

## Usage Examples

{{< showIfExists "static/mkfifo.svg" >}}

Make a FIFO at a provided path.

```bash
$ mkfifo path/to/pipe
```

## Notes

- The functionality of a FIFO file can be demonstrated in the following way:
  First, make a FIFO using `mkfifo myfifo` at any location. In the same terminal,
  use `tail -f myfifo` monitor its contents. Next, open a new terminal, leaving
  the first open, and enter `echo "mystring" > myfifo`. Your string
  "mystring" will go through the pipe and be displayed in the output
  of the `tail` command.
