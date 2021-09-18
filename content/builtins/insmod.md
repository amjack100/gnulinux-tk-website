---
title: "insmod | rmmod"
date: 2021-08-12T07:28:45-04:00
---

`insmod` and `rmmod` are programs for respectively inserting modules into the
Linux kernel and removing them. The official manual descriptions of both tools
recommends the use of `modprobe` as an alternative way of performing these
operations.

> Most users will want to use modprobe(8) instead, which is more clever and can
> handle module dependencies
>
> -- <cite>Manual page insmod(8)</cite>

## Usage Examples

Insert a kernel module

```bash
$ sudo insmod module.ko
```

Remove a kernel module

```bash
$ sudo rmmod bluetooth
```

## Notes

- The kmod package was initially called "modutils" and then "module-init-tools".
