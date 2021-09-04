---
title: "{{ replace .Name "-" " " | lower }}"
date: {{ .Date }}
draft: true
---

`{{ .Name }}` is used for
The name `{{ .Name }}` comes from

## Usage Examples

...

{{< showIfExists "static/{{ .Name }}.svg" >}}

...

```bash
...
```

...

```bash
...
```

## Notes

-
