---
title: "tr"
date: 2021-08-26T18:29:23-04:00
---

`tr` is a command for **tr**anslating / **tr**ansliterating text characters. The
term _translate_ in the context of `tr` has nothing to do with across-language
translation, but instead refers to a mapping of certain characters to others.

## Usage Examples

Replace all occurrences of a character in a file.

```bash
$ tr a b < ./file.txt
```

_All instances of the character 'a' will be replaced with 'b'._

Translate all the lower-case characters of a file to upper-case.

```bash
$ tr "[:lower:]" "[:upper:]" < ./file.txt
```

Delete all occurrences of a given character set.

```bash
$ tr -d 'abcdefg' < ./file.txt
```

## Notes

- More special sequences like "[:lower:]" and "[:upper:]" can be viewed in the
  manual along with their meanings with `man tr`.
