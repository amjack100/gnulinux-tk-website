---
title: "true | false"
date: 2021-09-28T19:31:40-04:00
---

`true` and `false` are considered commands but do nothing except return an exit
status. An exit status indicates whether a command failed or succeeded. <br>
<br> `true` does nothing, successfully. <br> `false` does nothing,
unsuccessfully.

## Usage Examples

{{< showIfExists "static/true.svg" >}}

Repeatedly execute a command in a loop.

```bash
while true
do
  echo hello
done
```

Execute a command but force a particular exit code.

```bash
echo hello && false
```

## Notes

- `true` and `false` are shell builtins, but the GNU Coreutils versions also
  exist at /bin/true and /bin/false.
