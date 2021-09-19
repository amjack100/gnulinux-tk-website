---
title: "ffmpeg"
date: 2021-07-20T18:30:37-04:00
draft: true
---

`ffmpeg` is a video and audio tool that is capable of handling a wide range of
media types. It can perform video conversion, trimming, frame extraction and
many other functions very quickly.

## Basic Functionality

Convert an audio file.

```sh
ffmpeg -i input.ogg output.mp3
```

Convert a video file.

```sh
ffmpeg -i input.mp4 output.webm
```

## Workflows

### Extracting frames from a video

```sh
mkdir output
ffmpeg -i animation.gif ./output/%3d.png

# ls output

# 001.png  005.png  009.png ...
# 002.png  006.png  010.png ...
# 003.png  007.png  011.png ...
```

### Trimming a video based on a start and end time

```sh
ffmpeg -ss 00:01:00 -i input.mp4 -to 00:02:00 -c copy output.mp4
```

> Arguments
>
> - -i input.mp4 Our input file
> - -ss 00:01:00 Seek to position at 1 minute
> - -to 00:02:00 End at the position at 2 minutes
> - -c copy Trim via stream copy
> - output.mp4 Trimmed output file

See the StackOverflow post [here](https://stackoverflow.com/a/42827058) for more
information.
