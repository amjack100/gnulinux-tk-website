---
title: "du"
date: 2021-07-16T08:55:20-04:00
---

`du` is a tool for getting information about the **d**isk **u**sage of a file or
directory.

## Usage Examples

Get the disk usage of a single file or directory

```bash
$ du -sh ./directory
```

... where `-sh` stands for summarize and human-readable

Get the size of a single file or directory

```bash
$ du -bsh ./directory
```

...where -b is equal to `--apparent-size --block-size=1`

## Notes

- The block size defaults to 1024 bytes but can be modified with the environment
  variables `DU_BLOCK_SIZE`, `BLOCK_SIZE`, or `BLOCKSIZE`

- See
  ["why is the output of \`du\` often so different from \`du -b\`"](https://stackoverflow.com/questions/5694741/why-is-the-output-of-du-often-so-different-from-du-b/5694854#5694854)
