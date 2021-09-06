---
title: "lsmod"
date: 2021-08-06T11:32:14-04:00
draft: true
---

`lsmod` is a minimal command for listing the modules in the Linux Kernel. It
will provide the output in table format, like:

| Module    | Size  | Used by             |
| --------- | ----- | ------------------- |
| tcp_diag  | 16384 | 0                   |
| udp_diag  | 16384 | 0                   |
| inet_diag | 24576 | 2 tpc_diag,udp_diag |

## Usage Examples

```bash
$ lsmod
```
