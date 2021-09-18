---
title: "cp"
date: 2021-08-11T17:13:25-04:00
---

`cp` is the standard **c**o**p**y command packaged into Linux systems.

## Usage Examples

Copy a single file to another file.

```bash
$ cp file.txt copy.txt
```

Copy files to a directory.

```bash
$ cp file.txt directory
```

Copy an entire directory tree to another location.

```bash
$ cp -r source-dir destination-dir
# where source-dir might be a structure like:
#source-dir/
#└── one
#    └── two
```

## Notes

- Backup suffixes can be defined with the _VERSION_CONTROL_ environment
  variable.
