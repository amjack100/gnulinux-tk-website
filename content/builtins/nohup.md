---
title: "nohup"
date: 2021-09-17T09:04:35-04:00
draft: true
---

`nohup` is a shell builtin used for running commands whose processes are able to
run beyond the lifetime of the parent process/processes (shell or terminal
emulator). <br><br> When a command is run from a shell, a parent-child
relationship is formed between the two processes (the shell being the parent and
the command process being the child). If a parent process is stopped, its
children processes are stopped as well. Running a command with `nohup` prevents
this relationship. Therefore, if the shell process which ran the command is
killed, the command itself continues to run. <br><br> The name `nohup` comes
from **no** **h**ang**up**, because it runs commands that are immune to hangup
signals (one way the operating system tells a processes to quit).

## Usage Examples

Run a command independent of its parent process.

{{< showIfExists "static/nohup.svg" >}}

## Notes

- Using `nohup` is similar to using `disown` like so:

```bash
$ sleep 1000 & disown
```

except `disown` will always print output to the terminal, while `nohup` will
always write output to a file.
