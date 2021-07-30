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

List all servies

```sh
systemctl
```

Start a service _(where sshd is an example service name)_

```bash
systemctl start sshd
```

Stop a service

```bash
systemctl stop sshd
```

Restart a service

```bash
systemctl restart sshd
```

Check the status of a service

```bash
systemctl status sshd
```

Make a service start on system boot

```bash
systemctl enable sshd
```

Stop a service from running on system boot

```bash
systemctl disable sshd
```

## Configuration
-
-

