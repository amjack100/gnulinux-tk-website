---
title: "cmake"
date: 2021-07-20T14:32:04-04:00
draft: true
---

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

