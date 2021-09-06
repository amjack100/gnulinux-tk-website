---
title: "make"
date: 2021-07-25T18:16:03-04:00
draft: true
---

_This page is a work in progress_

`make` is a tool for organizing a build process for any programming language.
Most programming projects involve some of sequential process of compiling source
code files using various commands. A hierarchy develops where certain files
might depend on the existence of others in order to assure a successful
compilation, and therefore a successful program. <br> <br> At its simplest,
`make` stores a list of these commands under a single name a "Makefile". With a
Makefile, all of these commands can then be run at once, hiding the complexities
of the build process and preventing the builder from running potentially
hundreds of commands manually over and over again.
