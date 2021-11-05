---
title: "groups"
date: 2021-10-03T19:04:26-04:00
---

`groups` displays the groups that the current user is a member of.

## Usage Examples

Get the groups the current user belongs to.

{{< showIfExists "static/groups.svg" >}}

Get the groups of a specific user.

```bash
$ groups someuser
```

Get the groups of multiple users.

```bash
$ groups user1 user2 user3
```

## Notes

- Also see the related commands `groupadd` and `groupdel`.
