---
title: "systemd"
date: 2021-07-10T11:53:31-04:00
draft: true
---

`systemd` is the first process run on boot and acts as the manager for all
running services (programs which run in the background). The main configuration
entities of `systemd` are simply called "units", of which there are 11 different
types. The most commonly used unit is the service unit, which are described
individually in .service files. There are several commands for tapping into the features
of systemd, including `systemctl` and `journalctl`, as well as special syntaxes for
customizing each of the types of unit files.

## Most Common Usages

_`systemd` is hardly ever invoked directly, but instead called by the system.
`systemctl` and`journalctl` provide entry points._

List all the running units

```sh
systemctl
```

Start/stop/restart a service _(where sshd is an example service name)_

```sh
systemctl start sshd
systemctl stop sshd
systemctl restart sshd
```

Check the status of a service

```sh
systemctl status sshd
```

Enable/disable a service to start on system boot

```sh
systemctl enable sshd
systemctl disable sshd
```

## Configuration

Creating a custom service

A new .service file should be created in `/etc/systemd/system`. Symlinked
files placed elsewhere will not work with the `systemctl enable` command and
therefore won't be able to be triggered on system startup.
<br>
`/etc/systemd/system/new_service.service`
<br>
