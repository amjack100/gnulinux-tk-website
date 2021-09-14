---
title: "wc"
date: 2021-08-20T18:35:39-04:00
draft: true
---

`wc` is a tool for getting the **w**ord **c**ount from a file or files. It also
capable of getting newline, character, and byte counts. `wc`'s definition of a
word is

> a non-zero-length sequence of characters delimited by white space.
>
> -- <cite>Manual page wc(1)</cite>

## Usage Examples

Get the newline, word, and byte counts of a text stream.

{{< showIfExists "static/wc.svg" >}}

Print only the word count of a text stream.

```bash
$ echo one two three | wc -w
```

Print the newline, word, and byte counts of a file.

```bash
$ wc file.txt
```

## Notes

- Other than words, you can also specify `-c`, `-m`, and `-l` for bytes, chars,
  and lines respectively.
