---
title: "rsync"
date: 2021-07-13T08:21:30-04:00
---

`rsync` is a copying tool that implements a delta-transfer algorithm for
extremely fast and efficient transfers. It finds files that have changed in size
or last-modified time to determine the necessary updates to the destination.

If rsync is used over ssh, it requires that both the client and server have the
software installed.

## Usage Examples

Copy a directory (recursive) to a remote machine

```bash
$ rsync -vr ./source-dir server:/destination
```

Copy a directory (recursive) to the host machine

```bash
$ rsync -vr server:/source-dir ./destination
```

Where a host named "server" is predefined in ~/.ssh/config

## Configuration

`rsync` reads the configuration file associated with `ssh`. See [ssh
configuration]({{< ref "builtins/ssh.md#configuration" >}})

## Notes

- A trailing "/" defines whether the source-dir is included as opposed to only
  the sub-contents. Forgetting this can lead to confusing situations. <br>

- `rsync` has an optional daemon component, rsyncd, but the end functionality is
  effectively identical to simply using the executable (unless the file transfer
  involves a significant amount of data). The daemon does not have any file
  monitoring capabilities or anything similar.

- See [how rsync works](https://rsync.samba.org/how-rsync-works.html) and
  [the rsync algorithm](https://rsync.samba.org/tech_report/tech_report.html)
