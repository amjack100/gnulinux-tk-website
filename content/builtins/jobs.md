---
title: "jobs | fg | bg"
date: 2021-09-09T10:10:20-04:00
draft: true
---

`jobs`, `fg` and `bg` are the three tightly coupled job control/management
commands. Using one effectively is difficult without an understanding of the
other two. These three are builtins to the popular _bash_ shell, meaning
implementations in other shells may not be the same.

## Overview

{{< showIfExists "static/jobs.svg" >}}

Jobs are simply background tasks. One typically uses a job for a long running
command where the output does not need to be monitored in real time. Jobs are
also "children" of the current shell, meaning if the shell processes is killed,
then the job is as well. Using

```bash
$ jobs
```

displays all the currently active jobs per shell. Essentially, `jobs` is the
`ls` of background processes.

- List jobs alongside their PIDs (process IDs).

```bash
$ jobs -l
```

- Show only the running jobs.

```bash
$ jobs -r
```

- Show only the stopped jobs.

```bash
$ jobs -s
```

`fg` "unhides" a background job. The job specified by `fg` will once again be
made as though it were run as a normal command.<br>

- Bring a job back to the foreground.

```bash
$ fg % 1
```

...where 1 refers to a job with job ID 1.

`bg` starts a job which is already in the background but in a "stopped" state. A
command is set as a "stopped" job by:

1. First running the command like normal
2. Pressing CTRL-Z

- Start running a stopped job:

```bash
$ bg % 1
```

...where 1 refers to a _stopped_ job with job ID 1.
