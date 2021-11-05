---
title: "groupadd | groupdel"
date: 2021-10-08T16:40:06-04:00
---

`groupadd` and `groupdel` are commands used for adding and removing groups. A
group is a collection of users that can be given special permissions. If a group
has permission to write to file named _file.txt_ and a user belongs to said
group, then that user is able to edit _file.txt_.

## Usage Examples

Create a group.

```bash
$ sudo groupadd mygroup
```

Create a group with a specific groupid.

```bash
$ sudo groupadd mygroup -g groupid
```

Delete an existing group.

```bash
$ sudo groupdel mygroup
```

## Notes

- A list of all the groups on the system can be found in the file _/etc/group_,
  or by using the command `getent group` which prints identical output.
- Not to be confused with `addgroup` and `delgroup`, which are the interactive
  wrapper versions of these commands.
- Also see the `useradd` and `userdel` commands.
