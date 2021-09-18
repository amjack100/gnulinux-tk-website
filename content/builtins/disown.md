---
title: "disown"
date: 2021-09-15T13:25:54-04:00
---

`disown` is a bash/sh builtin command used for detaching a job (a background
process) from its parent process (typically a shell like bash). The name
`disown` describes the way in which the shell no longer _owns_ the specified
job.

## Usage Examples

Disown a job by providing the job number.

```bash
$ disown %1
```

In this case, we've detached the job with ID 1 from the current shell. Now, the
shell process can be killed and the job will continue to run anyway. Normally if
a shell process is killed, any jobs will be killed along with it as a job is a
"child" of its shell.

Disown the current job.\*

```bash
$ disown
```

{{< showIfExists "static/disown.svg" >}}

Disown all jobs.

```bash
$ disown -a
```

## Notes

- We can find the _current job_ using the `jobs` command. Using `jobs` with no
  arguments will print a list of all the shell's jobs, of which the _current
  job_ is signified with a "+" next to its job number. The example output below
  tells us that job 2 is the current job.

  ```txt
  [1] - Running         mycommand1 &
  [2] + Running         mycommand2 &
  ```
