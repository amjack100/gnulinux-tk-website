---
title: "w | uptime"
date: 2021-09-29T08:55:30-04:00
---

`w` displays **w**ho is logged in and **w**hat each user is doing. The first
line of the output of `w` is the same as using `uptime` without any arguments.

## Usage Examples

Get some information about users and the processes they are running.

{{< showIfExists "static/w.svg" >}}

```bash
$ w

# 09:03:26 up  1:07,  1 user,  load average: 0.48, 0.44, 0.32
# USER     TTY      FROM             LOGIN@   IDLE   JCPU   PCPU WHAT
# user     :0       :0               07:56   ?xdm?  10:40   0.00s /usr/lib/gdm3/gdm-x-session --register-session --run-script i3
```

Get the same information but for a specific user.

```bash
$ w someuser
```

Get the same information but hide LOGIN@, JCPU, and PCPU.

```bash
$ w --short
```

Only get user login times, # of users, etc. (first line of `w`).

```bash
$ uptime
```

Display the output of `uptime` as an easy-to-read string.

```bash
$ uptime --pretty
```

## Notes

- Column meanings:

| Label  | Meaning                                      |
| ------ | -------------------------------------------- |
| USER   | The user's name                              |
| TTY    | The user's terminal                          |
| FROM   | Host name or IP of where user is logged in   |
| LOGIN@ | Time user logged in                          |
| IDLE   | Time since user interacted with the terminal |
| JCPU   | Time used by all processes attached to TTY   |
| PCPU   | Time used by the process in WHAT             |
| WHAT   | The user's current process                   |
