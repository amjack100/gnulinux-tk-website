---
title: "systemctl"
date: 2021-07-10T11:53:31-04:00
draft: true
---

`systemctl` is a tool for tapping into systemd, a program which will
always be running in the background. systemd calls everything "units",
which are just files which each maintain a more specialized part of the whole system.
There are 11 different types of units. Here are the first two:

1. Service units - start and control daemons (programs that run in the background)
2. Socket units - represent "sockets" which have to do with network connections

## Most Common Usages

List all the servies `systemctl list-units` or just `systemctl`

Start a service

```bash
systemctl start <unit>
systemctl start sshd
```

Stop a service

```bash
systemctl stop <unit>
systemctl stop sshd
```

Restart a service

```bash
systemctl restart <unit>
systemctl restart sshd
```

Check the status of a service

```bash
systemctl status <unit>
systemctl status sshd
```

Make a service start on system boot

```bash
systemctl enable <unit/path>
systemctl enable sshd
```

Stop a service from running on system boot

```bash
systemctl disable <unit/path>
systemctl disable sshd
```
