---
title: "file"
date: 2021-09-19T10:34:13-04:00
---

`file` is a "file type guesser", used for getting the file type and metadata of
a particular file by looking at its contents. `file` is not part of
[GNU](https://www.gnu.org/home.en.html) like many of the built-ins, but is
included in most distributions.

## Usage Examples

Get some information about a file.

{{< showIfExists "static/file.svg" >}}

Get the file types of some files within a zipped archive.

```bash
$ file -z archive.zip
```

Allow `file` to read special (block/char device) files.

```bash
$ file -s /dev/null
```

## Notes

- Read more [here](<https://en.wikipedia.org/wiki/File_(command)#Specification>)
  about how the `file` command is able to extract file data based on contents.
