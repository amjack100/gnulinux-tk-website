---
title: "rsync"
date: 2021-07-13T08:21:30-04:00
draft: true
---

rsync is a copying tool that implements a delta-transfer algorithm for
extremely fast and efficient transfers. It finds files that have changed
in size or last-modified time to determine the necessary updates to
the destination.

If rsync is used over ssh, it requires that both the client and server have
the software installed.

<center>

| rsync | |
:--------------------|---------------:
| run directly         |          yes    |
| configuration   | ~/.ssh/config (if applicable) |
| service              | rsyncd.service  |

</center>

## Most Common Usages

Copy a directory (recursive) to a remote machine

```sh
rsync -r ./source-dir server:/destination
```

Copy a directory (recursive) to the host machine

```sh
rsync -r server:/source-dir ./destination
```

Where a host named "server" is predefined in ~/.ssh/config

## Configuration

See [ssh configuration]({{< ref "commands/ssh.md#configuration" >}})

## Notes

rsync has an optional daemon component, rsyncd, but the end functionality
is effectively identical to simply using the executable (unless the file transfer
involves a significant amount of data). The daemon does not have any file monitoring
capabilities or anything similar.

[How rsync works](https://rsync.samba.org/how-rsync-works.html)
<br>
[The rsync algorithm](https://rsync.samba.org/tech_report/tech_report.html)


