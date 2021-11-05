---
title: "type"
date: 2021-09-23T20:04:18-04:00
---

`type` is used for descibing a command as a classification of 5 possible command
types:

- shell built-in
- function
- alias
- hashed command
- keyword

Otherwise if the command provided is an executable file, then its full path will
be displayed.

## Usage Examples

Display a command's type.

{{< showIfExists "static/type.svg" >}}

Display all the locations of an executable.

```bash
$ type -p python
```

## Notes

- `command -V` provides similar functionality to `type`.
