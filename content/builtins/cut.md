---
title: "cut"
date: 2021-09-26T14:23:32-04:00
---

`cut` is used for extracting sections of input line by line. The user can define
what a section is in terms of bytes, characters, or fields. Standard output can
be piped to `cut` but the it is most commonly used with files.

## Usage Examples

Consider a file _file.txt_ containing the following lines of text:

```txt
one,two,three,four,five,six,seven
a,b,c,d,e,f,g
```

{{< showIfExists "static/cut.svg" >}}

Cut a range of characters from each line of a file.

```bash
$ cut -c 10-20 file.txt
#hree,four,f
#,f,g
```

Cut the everything from the 5th field (inclusive) from each line of a file.

```bash
$ cut -d "," -f 5- file.txt
#five,six,seven
#e,f,g
```

Cut only the 3rd field from each line of a file.

```bash
$ cut -d "," -f 5 file.txt
#three
#c
```

## Notes

- In addition to **-c** for characters and **-f** for field, **-b** can be used
  for getting a range of _bytes_. `cut -b 1-50` would get the first 50 bytes.
