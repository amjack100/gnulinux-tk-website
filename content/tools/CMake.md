---
title: "cmake"
date: 2021-07-20T14:32:04-04:00
draft: true
---

CMake is a tool that creates build setups for source code, allowing that code to
be cross platform.

The root of a CMake entity is always defined by a `CMakeLists.txt` file.

### Bare Minimum Example

```sh
.
├── CMakeLists.txt
└── main.cpp
```

`CMakeLists.txt`

```cmake
cmake_minimum_required(VERSION 3.10)

project(Main)

add_executable(Main main.cpp)
```

```sh
mkdir build
cd build && cmake ..
```


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




