---
title: "install"
date: 2021-09-02T19:46:26-04:00
---

`install` is a command for copying files and optionally setting the permissions
of that file simultaneously. It can be thought of as the `chmod` and `cp`
commands combined into one for the sake of convenience, and is usually used to
move a newly compiled program to a destination like _/bin_ or _/usr/local/bin_.

## Usage Examples

Copy files to a destination (same as `cp` + `chmod +x`).

{{< showIfExists "static/install.svg" >}}

Copy files to a destination while also setting the mode.

```bash
$ install -m +x path/to/source path/to/destination
```

Copy files to destination while also setting the ownership to a specific user.

```bash
$ install -o user path/to/source path/to/destination
```

## Notes

- For new Linux users: one might understand the name _install_ to mean "to
  install software from an outside source", however, this is not the case. The
  _install_ command is more of an enhanced `cp` and one should use the built-in
  package manager `apt-get` or `yum` to install external software.

- `install` reads the _SIMPLE_BACKUP_SUFFIX_ environment variable in case the
  user would like to install files without risk of accidentally erasing data.
