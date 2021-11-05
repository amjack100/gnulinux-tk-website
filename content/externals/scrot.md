---
title: "scrot"
date: 2021-09-27T08:57:10-04:00
---

`scrot` is a program used for taking **scr**eensh**ot**s. `scrot` supports a
wide many image formats as well as options for interactive screen selection.

## Usage Examples

...

{{< showIfExists "static/scrot.svg" >}}

Take a screenshot and save it to the current working directory. The filename
will be the current date.

```bash
$ scrot
```

Take a screenshot and save it as "capture.png".

```bash
$ scrot capture.png
```

Take a screenshot interactively.

```bash
$ scrot --select capture.png
```

Take a screenshot of the current window.

```bash
$ scrot --focused capture.png
```

Take a screenshot but wait 10 seconds first.

```bash
$ scrot --count --delay 10 capture.png
```

## Notes

- `--exec` can be used to run a command on the image file immediately after it's
  saved.
- Special specifiers can be used with `--exec` and file naming. A few are
  exclusive to `--exec` are ignored in file naming:

    <br>

  | Specifier | Meaning                   |     Usage |
  | --------- | ------------------------- | --------: |
  | $a        | hostname                  |      both |
  | $f        | image path/filename       | exec only |
  | $m        | thumb image path/filename | exec only |
  | $n        | image name                | exec only |
  | $s        | image size (bytes)        | exec only |
  | $p        | image pixel size          |      both |
  | $w        | image width               |      both |
  | $h        | image height              |      both |
  | $t        | image format              | exec only |
  | $$        | literal '$'               |      both |

<br>

- Exec and file naming example from _scrot manpage_:

```bash
$ scrot '%Y-%m-%d_$wx$h.png' -e 'mv $f ~/shots/'
```

> "This would create a file called something like 2000-10-30_2560x1024.png and
> move it to your shots directory."
