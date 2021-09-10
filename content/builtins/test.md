---
title: "test | ["
date: 2021-08-21T08:32:40-04:00
draft: true
---

`test` is a useful scripting command for evaluating various expressions. It will
return 0 (true) or 1 (false) based on the value of the given expression, making
it the effective counterpart of the `if` command built into many shells. <br>
<br> The literal `[` character is identical to `test`, although its usage
requires a a closing brace at the end of the provided expression. <br> <br> The
type of expression that `test` evaluates is based on the flag it is given as a
parameter. See the chart below for a quick reference to each flag.

## Overview

Test for the existence of a file.

```bash
if test -f file.txt; then
  echo "File exists"
fi
```

Test for the existence of an environment variable _(alternative syntax)_.

```bash
if [ -n $USER ]; then
  echo $USER
fi
```

Compare the value of two integers.

```bash
num1=32
num2=20

if [ $num1 -gt $num2 ]; then
  echo "$num1 > $num2"
fi
```

## Workflows

The usefulness of `test` becomes clear when we begin to combine it with other
commands and scripting structures like for loops.

Here is a basic script that uses `test` to discard empty files. It will iterate
over all the files in the user's current working directory, using `test -s` with
the negate operator `!` to find files with no content. Then, it uses `rm` with
the interactive flag to confirm deletion.

```bash
#rmempty.sh
for f in *; do
  if test ! -s $f;then
    echo "File "$f" is empty"
    rm --interactive $f
  fi
done
```

```bash
$ rmempty.sh

File garbage.txt is empty
rm: remove regular empty file 'garbage.txt'?
```

Maybe you'd like to create a script that behaves according to the value of a
certain environment variable. This example tests the LANG environment variable
and reacts with the appropriate greeting. Respecting possible differences in
environment conditions is a great way of making code in general more robust, not
just small scripts.

```bash
#greeting.sh
if [ $LANG = en_US.UTF-8 ]; then
  echo "Welcome!"
elif [ $LANG = de_DE.UTF-8 ]; then
  echo "Willkommen!"
fi
```

`test` reads the value of the environment variable $LANG, which specifies the
user's language setting.

```bash
$ LANG=en_US.UTF-8 greeting.sh

Welcome!

$ LANG=de_DE.UTF-8 greeting.sh

Willkommen!
```

## Notes

- For further information, see the `test`
  [official documentation](https://pubs.opengroup.org/onlinepubs/009695399/utilities/test.html)
