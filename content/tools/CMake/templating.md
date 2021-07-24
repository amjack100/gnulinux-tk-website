---
title: "templating"
date: 2021-07-21T11:06:34-04:00
draft: true
---

### File Templating

CMake can format input files with variables specified in CMakeLists.txt,
and produce an output in the build folder.

```sh
.
├── CMakeLists.txt
└── format-in.txt
```

`CMakeLists.txt`

```cmake
configure_file(format-in.txt format-out.txt)
```

`format-in.txt`

```txt
The project version is: @Main_VERSION_MAJOR@
```




