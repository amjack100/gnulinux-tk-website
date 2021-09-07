---
title: "apt"
date: 2021-07-29T10:14:18-04:00
draft: true
---

`apt` stands for **A**dvanced **P**acakge **T**ool and is the main package
management system built into many Linux distributions. `apt` is intended to be
the main means of interactively managing packages, but its features are also
available in the back-end commands `apt-get` and `apt-cache`. <br> <br> `apt` is
the middle man between a remote repository and `dpkg`. It will check for
dependencies, download packages, and use `dpkg` to install them.

## Usage Examples

Install a package.

```bash
$ sudo apt install package
```

Uninstall a package.

```bash
$ sudo apt remove package
```

## Configuration

### Package sources

`/etc/apt/sources.list` stores package sources/locations

#### Example sources.list

```txt
deb http://us.archive.ubuntu.com/ubuntu focal main restricted
deb-src http://us.archive.ubuntu.com/ubuntu focal main restricted

deb http://security.ubuntu.com/ubuntu focal-security main restricted
deb-src http://security.ubuntu.com/ubuntu focal-security main restricted

deb http://us.archive.ubuntu.com/ubuntu focal-updates main restricted
deb-src http://us.archive.ubuntu.com/ubuntu focal-updates main restricted
```

Line format: _archive-type repository-url distribution component_

_Archive type_ can be `deb` (pre-compiled, binary packages) or `deb-src` (source
packages)

<br>
`/etc/apt/apt.conf` APT configuration file
<br>
`/etc/apt/preferences` stores particular preferences of specific packages (version,
source, etc.)

<!--https://wiki.debian.org/SourcesList-->

An example `/etc/apt/apt.conf`

```txt

APT
{
  // Options for apt-get
  Get
  {
     Download-Only "false";
  };

};

// Options for the downloading routines
Acquire
{
  Retries "0";
};

// Things that effect the APT dselect method
DSelect
{
  Clean "auto";   // always|auto|prompt|never
};

DPkg
{
  // Probably don't want to use force-downgrade..
  Options {"--force-overwrite";}
}
```

## Notes
