---
title: "touch"
date: 2021-07-15T11:51:11-04:00
---

`touch` is command used to update the access and modification times of a file.
It is most commonly used as a quick way of creating a new, empty file.

## Usage Examples

Create an empty file.

```bash
$ touch file.txt
```

Update the timestamp of a file without creating a new one if it doesn't exist.

```bash
$ touch -c existingfile.txt
```
