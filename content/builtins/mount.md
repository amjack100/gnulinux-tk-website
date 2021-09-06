---
title: "mount | umount"
date: 2021-08-15T17:55:53-04:00
draft: true
---

`mount` and `umount` are commands for mounting and unmounting a filesystem, respectively.
A common use for these commands involves accessing files on a USB drive or some type
of other removable device. Filesystems can typically only be mounted by the super
user (with `sudo`).

## Usage Examples

Mount a USB drive

```bash
$ sudo mkdir -p /media/usb
$ sudo mount /dev/sda1 /media/usb
```

Unmount a mounted USB drive

```bash
$ sudo umount /dev/sda1
```

## Configuration

The _/etc/fstab_ file is the main configuration point for the `mount` command.
One can use _/etc/fstab_ to store preset locations for particular devices.
An unconfigured fstab file will contain the following comments providing instructions
for configuration:

```bash
# /etc/fstab: static file system information.
#
# Use 'blkid' to print the universally unique identifier for a
# device; this may be used with UUID= as a more robust way to name devices
# that works even if disks are added and removed. See fstab(5).
#
# <file system> <mount point>   <type>  <options>       <dump>  <pass>
```

An example of a line configuring a single device might be:

```txt
/dev/sda1     /media/usb      vfat     defaults     0     0
```

From there, usage of the command...

```bash
$ sudo mount /dev/sda1
```

...would mount the device at sda1 to _/media/usb_.

## Notes

- `sudo mount -a` should be used to check the configuration at _/etc/fstab_ for
  formatting/syntax errors after edits are made. A faulty fstab file can cause complications
  at system boot.
