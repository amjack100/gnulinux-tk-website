---
title: "id | whoami"
date: 2021-08-27T16:55:01-04:00
draft: true
---

<!--<p align="center">-->
<!--</p>-->

`id` is a command which will display various information specific to a user,
including _UID_ (user ID) and _GID_ (group ID). These are unique numbers
that are used to determine which resources each user/group may or may not
be given access to. `whoami` is a shortcut command that is identical to
`id -un`.

## Usage Examples

Display the user's ID, group ID, and groups to which that user belongs.

{{< showIfExists "static/id.svg" >}}

<!--```bash-->
<!--```bash-->
<!--id-->
<!--```-->

Diplay the current user ID number.

```bash
$ id -u
```

Diplay the current group ID number.

```bash
$ id -g
```

Diplay the name of the current user.

```bash
$ whoami
```

## Notes

- The operating system keeps the User ID 0 and Group ID 0 reserved
  for the _root_ user.

- The same user information can also be found within the _/etc/passwd_ file. You
  can see this with `grep user /etc/passwd`, replacing "user" with the actual
  user's name you'd like to look up.
