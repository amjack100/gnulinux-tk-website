---
title: "jobs | fg | bg"
date: 2021-09-09T10:10:20-04:00
draft: true
---

`jobs`, `fg` and `bg` are the three tightly coupled job control/management
commands. Using one effectively is difficult without an understanding of the
other two. These three are builtins to the popular _bash_ shell, meaning
implementations in other shells may not be the same. They also lack their own
individual manual "`man`" pages.

## Overview

{{< showIfExists "static/jobs.svg" >}}

Jobs are simply background tasks. One typically uses a job for a long running
command where the output does not need to be monitored in real time. Jobs are
also "children" of the current shell, meaning if the shell processes is killed,
then the jobs is as well. Using

```bash
$ jobs
```

displays all the currently active jobs per shell. The following are some
additional options available to the `jobs` command.<br>

List jobs alongside their PIDs (process IDs).

```bash
$ jobs -l
```

Show only the running jobs.

```bash
$ jobs -r
```

Show only the stopped jobs.

```bash
$ jobs -s
```

Essentially, `jobs` is the `ls` equivalent to background processes.

```bash
...
```

...

```bash
...
```

## Notes

-
