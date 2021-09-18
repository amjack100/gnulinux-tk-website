---
title: "uname"
date: 2021-07-19T08:51:11-04:00
---

`uname`, short for **u**nix **name**, is a simple tool for getting information
about the current system.

## Usage Examples

Print system information about the kernel, processor, and operating system.

```bash
$ uname -a
```

Pair with `dkms` to install a kernel module to the current kernel version.

```bash
$ sudo dkms install nvidia/460.39 -k $(uname -r)
```

## Notes

- `uname` offers many flags such as `-m` and `-s` (machine and kernel-name)
  which provide a way for scripts to get specific values.
