---
title: "locate | updatedb"
date: 2021-08-19T13:54:27-04:00
---

`locate` is a tool that finds a file based on a pre-loaded database. `updatedb`
is the command which allows one to interact with that database. These commands
act as a single utility for locating files system-wide. Compared to `find`,
`locate` operates much more quickly. However, it may retrieve unreliable results
if `updatedb` is not at an appropriate frequency.

## Usage Examples

Search for a file system-wide by a whole-name pattern.

```bash
$ locate filename
```

Perform the same search but on _confirmed existing_ files.

```bash
$ locate -e filename
```

Perform a similar search but with a regex pattern.

```bash
$ locate -r 'filename.+'
```

Update the locate file database.

```bash
$ sudo updatedb
```

## Configuration

The _LOCATE_PATH_ environment variable can be configured with a colon-separated
list of searchable databases.

## Notes

- The `-e` confirmed existing option provides a "safety check" in case files in
  the database have been moved/deleted since it was last updated.

- While `updatedb` can be used directly from the command line as shown, it's
  best to have it set on an automatic schedule (ideally overnight, if running on
  an always-on machine).

- The manual page _LOCATEDB(5)_ offers additional information on the usage of
  these tools in conjunction with one another.
