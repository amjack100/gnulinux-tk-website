---
title: "systemctl"
date: 2021-10-05T14:43:29-04:00
draft: true
---

`systemctl` is used for running and managing special files called _units_ using
a daemon (background program) known as systemd. The name `systemctl` comes from
system + **c**on**t**ro**l**.

## Overview

### Unit File Locations

_units_/_unit files_ are text files with special syntax. According to
`man systemd.unit`, the _system_ unit files are found here:

_System Unit Search Path_<br> /etc/systemd/system.control/\*<br>
/run/systemd/system.control/\*<br> /run/systemd/transient/\*<br>
/run/systemd/generator.early/\* <br> **/etc/systemd/system/\*** <br>
/etc/systemd/systemd.attached/\* <br> /run/systemd/system/\*<br>
/run/systemd/systemd.attached/\* <br> /run/systemd/generator/\* <br>...<br>
/lib/systemd/system/\*<br> /run/systemd/generator.late/\*

And the _user_ unit files are found here:

_User Unit Search Path_<br> ~/.config/systemd/user.control/\*<br>
$XDG_RUNTIME_DIR/systemd/user.control/\*<br>
$XDG_RUNTIME_DIR/systemd/transient/\*<br>
$XDGRUNTIME_DIR/systemd/generator.early/*<br>
**~/.config/systemd/user/\***<br> /etc/systemd/user/\*<br>
$XDG_RUNTIME_DIR/systemd/user/\*<br>
/run/systemd/user/\*<br>
$XDG_RUNTIME_DIR/systemd/generator/\*
~/.local/share/systemd/user/\*<br> ...<br> /usr/lib/systemd/user/\*
$XDG_RUNTIME_DIR/systemd/generator.late/\*

The bolded paths are commonly regarded as places where one should store manually
created unit files.

### Unit File Syntax

```bash
...
```

...

```bash
...
```

## Workflows

## Notes

-
