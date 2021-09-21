---
title: "pwd"
date: 2021-09-21T08:34:36-04:00
draft: true
---

`pwd` is a command used for **p**rinting the current **w**orking **d**irectory.
Every process has a current working directory (_CWD_) associated with it. If a
process makes a file _file.txt_ and its CWD happens to be _/some-folder_, it
will create the file _/some-folder/file.txt_

## Usage Examples

Get the current working directory.

{{< showIfExists "static/pwd.svg" >}}

## Notes

- The environment variable _$PWD_ contains the current working directory as
  well.
- The CWD can be changed using `cd` as shown 
