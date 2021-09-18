---
title: "shutdown"
date: 2021-09-06T08:02:08-04:00
---

`shutdown` is a command which simply allows one to shutdown their computer via
the command line. `shutdown` also provides 3 options in particular which, when
each used individually, perform the same functionality as the `poweroff`,
`reboot`, and `halt` commands.

## Usage Examples

Shutdown the computer.

{{< showIfExists "static/shutdown.svg" >}}

Note: _without any options provided, the shutdown is scheduled at +1 minute_

Shutdown immediately.

```bash
$ shutdown now
```

Reboot the computer in 5 minutes.

```bash
$ shutdown -r +5 &
```

Cancel a pending shutdown.

```bash
$ shutdown -c
```

## Notes

- Between the `poweroff`, `reboot`, and `halt` based option flags provided,
  _-P_, or, _--poweroff_, acts at the default.
