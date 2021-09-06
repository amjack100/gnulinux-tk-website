---
title: "env"
date: 2021-08-25T13:24:03-04:00
draft: true
---

`env` is the main **env**ironment variable utility and has a variety of
functionalities. `env` is unique in that one of its most common uses is as a
_shebang_ line, a single line at the top of a Linux file which dictates how that
file is executed.

## Usage Examples

Show the environment.

```bash
$ env
```

Set a variable (or multiple) and then run a program.

```bash
$ env key=value program
```

### Shebang

Using the [shebang](<https://en.wikipedia.org/wiki/Shebang_(Unix)>)
_#!/usr/bin/env_ at the top of a file can set the conditions by which the file
is executed. In this example case, it allows the file to be executed by the
python executable specific to a user's virtual environment. <br> <br> Say a user
has a special environment activated, _special_env_, and they go to execute a
python file with this shebang line:

```python
#!/bin/python3

import special_library
```

````bash
```bash
(special_env)$ ./file.py

Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
ModuleNotFoundError: No module named 'special_library'
````

An error occurs because this shebang line is referencing the _system-wide_
`python3` executable which does not have `special_library` installed. Using
`env` can resolve this issue.

```python
#!/usr/bin/env python3

import special_library
```

## Notes

- Most system shells allow the use of `key=value program` without the `env`
  command.
