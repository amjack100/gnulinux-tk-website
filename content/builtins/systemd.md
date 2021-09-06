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

## Usage Examples

_`systemd` is hardly ever invoked directly, but instead called by the system.
`systemctl` and`journalctl` provide entry points._

### systemctl

List all the running units

```bash
$ systemctl
```

Start/stop/restart a service _(where sshd is an example service name)_

```bash
$ systemctl start sshd
$ systemctl stop sshd
$ systemctl restart sshd
```

Check the status of a service

```bash
$ systemctl status sshd
```

Enable/disable a service to start on system boot

```bash
$ systemctl enable sshd
$ systemctl disable sshd
```

### journalctl

Watch a live feed of systemd logs

```bash
$ journalctl -f
```

Get the logs of a single service

```bash
$ sudo journalctl -u sshd
```

## Configuration

Creating a custom service

A new .service file should be created like so in one of these directories.

```bash
/etc/systemd/system/new_service.service
# sudo systemctl start new_service
~/.config/systemd/user/new_service.service
# systemctl --user start new_service
```

_Symlinked_ files placed elsewhere will not work with the `systemctl enable`
command and therefore won't be able to be triggered on system startup.
<br>
Here's a simple example.

```ini
[Unit]
Description=A New Service

[Service]
Type=simple
Environment="ONE=one"
ExecStart=/home/user/background-script.sh $ONE

[Install]
WantedBy=mutli-user.target
```

Note: [Install] is required for systemctl enable
<br>
Use `man systemd.service` to see all the types and options.
There are certain options such as ExecStartPre, ExecStartPost, ExecReload, etc.
which provide additional command triggers.
