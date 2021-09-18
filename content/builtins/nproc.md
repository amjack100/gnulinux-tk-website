---
title: "nproc"
date: 2021-09-06T18:42:09-04:00
---

`nproc` is a minimal command used for getting the **n**umber of **proc**essing
units (typically CPUs) available to the current machine.

## Usage Examples

Get the number of available processing units.

{{< showIfExists "static/nproc.svg" >}}

Get the number of installed processing units (+ inactive ones)

```bash
$ nproc -all
```

Get the number of processing units minus a provided amount.

```bash
$ nproc --ignore 4
```

## Notes

- `nproc` can be useful in situations where an external program would like to
  know how many jobs/processes to use when running concurrently. In these
  situations, `nproc` can be embedded in a script. For example, the program
  `make` uses the _-j_ option for the user to provide an optional job count.
  `nproc` can therefore be used like:

  ```bash
  $ make -j $(nproc)
  ```
