---
title: "pgrep"
date: 2021-09-03T21:01:34-04:00
draft: true
---

`pgrep` is a command for getting the PID(s) of a process or multiple processes using
a `grep`-like search string. The name of the command comes from the combination of
"**p**rocess" and grep. `pgrep` is particularly useful because many other
commands such as `kill` take a PID (random integer) as input.

## Usage Examples

Return PIDs of any running processes with a matching command string.

{{< showIfExists "static/pgrep.svg" >}}

Search for processes including their command-line options.

```bash
$ pgrep --full "process_name parameter"
```

Search for processes run by a specific user.

```bash
$ pgrep --euid root process_name
```

## Notes

- `prep` is commonly used embeded in places where a PID can be directly replaced
  with a name, for example: To give detailed information on all xterm processes:

```bash
$ ps -fp $(pgrep -d, -x xterm)
```
