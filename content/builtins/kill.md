---
title: "kill"
date: 2021-08-18T10:03:22-04:00
---

`kill` is a tool for sending a signal to a process. Its name comes from the fact
that its default signal is TERM, which effectively "kills" an actively running
process.

## Usage Examples

Terminate a running process.

```bash
$ kill 40831

# 40831 is a PID
```

Send an alternative signal to a process.

```bash
$ kill -CONT 40831

# The following are identical:

# kill -SIGCONT 40831
# kill -18 40831
# kill -s 18 40831
```

## Configuration

_This command has no configuration options._

## Notes

- One can also use `kill -l` to quickly list all the available signals. More
  information on the meanings of each signal can be found with `man 7 signal`.
