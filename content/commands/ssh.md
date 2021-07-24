---
title: "ssh"
date: 2021-07-12T07:33:57-04:00
draft: true
---

ssh is a program for logging into a remote computer and executing commands
on that computer. ssh connects and logs into the specified destination,
which may be specified as either [user@]hostname or ssh://[user@]hostname[:port]

The user trying to access the remote computer must prove their identity.

## Most Common Usages

Access a remote machine by providing a private key as input

```sh
ssh -i <private key file> <username>@<hostname> 
```

For example

```sh
ssh -i ~/.ssh/some-private-key.key john@100.100.10.10 
```

## Configuration

Save a host for easy access

```txt
~/.ssh/config

Host <myserver>
    Hostname <server-address>
    IdentityFile <private-key-file>
    User <user>

Host website
    Hostname 000.000.00.00
    IdentityFile ~/.ssh/some-private-key.key
    User john
```

Then, from the command line

```sh
ssh website
```

## Notes

In order for graphical terminal programs to function properly, it can be
necessary to add the "-t" flag which "forces pseudo-terminal allocation"

```sh
ssh -t ...
```


