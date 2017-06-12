---
author: Werner Robitza
title: FFmpeg Encoding and Editing Course
date: June 21, 2017
theme: white
#highlightTheme: 
revealOptions:
    transition: 'fade'
    slideNumber: true
---

<style type="text/css">
.reveal {
    font-size: 28px;
}
h1, h2, h3, h4, h5, p, pre, code {
    text-align: left
}
.reveal pre code {
    font-size: 18px;
    line-height: 22px;
}
.reveal p code,
.reveal li code {
    font-size: 24px;
}
.reveal ul, .reveal ol {
    display: block;
}
</style>


# FFmpeg Encoding and Editing Course

Werner Robitza  
June 21, 2017

---

## About me

* Researcher at T-Labs of Deutsche Telekom in Berlin
* PhD student at Technische Universität Ilmenau

Contact:

* `werner.robitza@gmail.com`
* http://slhck.info / `@slhck`

---

## Goals

You should learn:

* basic concepts
* install ffmpeg and tools
* encode videos
* apply filters
* debug videos

---

## Requirements

* These slides
* `ffmpeg`, `ffprobe` and `ffplay` installed
* Some sample videos

---

## Resources

Sample videos, linked from VQEG  
(Video Quality Experts Group):

https://www.its.bldrdoc.gov/vqeg/video-datasets-and-organizations.aspx

![](./vqeg.jpg)

---

# Introduction to FFmpeg

---

## About the Project

![](./ffmpeg.png)

* Free, open-source software for multimedia editing, conversion, …
* Started in 2000
* Continuous development until now

---

## Tools

FFmpeg contains:

* Command-line tools: `ffmpeg`, `ffprobe`, `ffserver`, `ffplay`
* Libraries: `libavformat`, `libavcodec`, `libavfilter`, …

---

## About the Libraries (`libav*`)

* `libavformat`: Reads and writes container formats (AVI, MKV, MP4, …)
* `libavcodec`: Reads and writes codecs (H.264, H.265, VP9, …)
* `libavfilter`: Various filters for video and audio
* ... and many more

---

## Installation / Compilation

Installation Method  | Pro           | Con
------------- | ------------- | -----
Building from source | Offers all options, tools, codecs | Takes time
Downloading static build | Easy and fast | Does not offer all codecs
Installing from package manager (e.g., `apt-get`) | Easy and fast | Does not always offer latest version or all codecs

Get source code and static builds from: http://ffmpeg.org/download.html

---

## Getting Help

Places to get help:

* 📖 Documentation: https://ffmpeg.org/ffmpeg-all.html
* 📖 Wiki: http://trac.ffmpeg.org/wiki
* 📖 IRC: `#ffmpeg`
* ✉ Mailing list: https://lists.ffmpeg.org/mailman/listinfo/ffmpeg-user/
* 🌐 Stack Overflow: https://stackoverflow.com/ and use `#ffmpeg`
* 🌐 Super User: http://superuser.com/ and use `#ffmpeg`

---

# General concepts

---

## Container Formats

Containers *contain* media data. Typical examples:

* MP4: MPEG-4 Part 14 container for H.264, H.264, AAC audio, …
* MKV: Versatile container for any media format
* AVI: Legacy container

See supported containers with:

```
$ ffmpeg -formats
File formats:
 D. = Demuxing supported
 .E = Muxing supported
 --
 D  3dostr          3DO STR
  E 3g2             3GP2 (3GPP2 file format)
  E 3gp             3GP (3GPP file format)
 D  4xm             4X Technologies
  E a64             a64 - video for Commodore 64
 D  aa              Audible AA format files
 ...
```

---

## Codecs

* CODEC = *Co*der / *Dec*oder
* Specification on how to code and decode video, audio, …
* Usually **not** a specification on how to encode / compress data

See supported codecs with:

```
$ ffmpeg -codecs
Codecs:
 D..... = Decoding supported
 .E.... = Encoding supported
 ..V... = Video codec
 ..A... = Audio codec
 ..S... = Subtitle codec
 ...I.. = Intra frame-only codec
 ....L. = Lossy compression
 .....S = Lossless compression
 -------
 D.VI.. 012v                 Uncompressed 4:2:2 10-bit
 D.V.L. 4xm                  4X Movie
 D.VI.S 8bps                 QuickTime 8BPS video
 .EVIL. a64_multi            Multicolor charset for Commodore 64 (encoders: a64multi )
 .EVIL. a64_multi5           Multicolor charset for Commodore 64, extended with 5th color (colram) (encoders: a64multi5 )
 D.V..S aasc                 Autodesk RLE
 D.VIL. aic                  Apple Intermediate Codec
...
```

---

## Most Important (Lossy) Codecs

Currently mostly used, standardized by ITU/ISO:

* 🎥 H.262 / MPEG-2 Part H: Broadcasting, TV, used for backwards compatibility
* 🎥 H.264 / MPEG-4 Part 10: The de-facto standard for video encoding today
* 🎥 H.265 / MPEG-H: Successor of H.264, up to 50% better quality
* 🔊 MP3 / MPEG-2 Audio Layer III: Used to be the de-facto audio coding standard
* 🔊 AAC / ISO/IEC 14496-3:2009: Advanced Audio Coding standard

Competitors that are royalty-free:

* 🎥 VP8: Free, open-source codec from Google
* 🎥 VP9: Successor to VP8, almost as good as H.265
* 🎥 AV1: Currently in development as a successor to VP9

---

## Most Important Lossless Codecs

Lossless codecs are useful for archival, editing, ...

* 🎥 Raw YUV, HuffYUV, FFV1
* 🔊 Raw PCM, FLAC, ALAC

Also, "visually lossless" codecs exist:

* 🎥 Apple ProRes, Avid DNxHD, high-quality H.264/H.265, ...

---

## Encoders

* Encoders are the *actual* software that outputs a codec-compliant bitstream
* Encoders can vary in quality and performance

Examples:

* 🎥 libx264: most popular free and open-source H.264 encoder
* 🎥 NVENC: NVIDIA GPU-based H.264 encoder
* 🎥 libx265: free and open-source HEVC encoder
* 🎥 libvpx: VP8 and VP9 encoder from Google
* 🔊 libfdk-aac: AAC encoder
* 🔊 `aac`: native FFmpeg AAC encoder
* …

→ lots of competition

---

## Encoders supported in FFmpeg

```
$ ffmpeg -encoders
Encoders:
 V..... = Video
 A..... = Audio
 S..... = Subtitle
 .F.... = Frame-level multithreading
 ..S... = Slice-level multithreading
 ...X.. = Codec is experimental
 ....B. = Supports draw_horiz_band
 .....D = Supports direct rendering method 1
 ------
 V..... a64multi             Multicolor charset for Commodore 64 (codec a64_multi)
 V..... a64multi5            Multicolor charset for Commodore 64, extended with 5th color (colram) (codec a64_multi5)
 V..... alias_pix            Alias/Wavefront PIX image
...
```

---

## Pixel Formats

* Representation of raw pixels in video streams
* Specifies order of luma/color components and chroma subsampling

![](./color-subsampling.png)

Supported  pixel formats:

```
ffmpeg -pix_fmts
```

---

# Encoding with the `ffmpeg` Command Line Tool

---

## General syntax

```bash
ffmpeg <global-options> <input-options> -i <input> <output-options> <output>
```

* Global options for log output, file overwriting, ...
* Input options for reading files
* Output options for:
    * conversion (codec, quality, ...)
    * filtering
    * stream mapping

---

## Transcoding and Transmuxing

Transcoding from one codec to another:

```bash
ffmpeg -i <input> -c:v libx264 output.mp4
```

Transmuxing from one container/format to another – without re-encoding:

```bash
ffmpeg -i input.mp4 -c copy output.mkv
```

ffmpeg will take one video, audio, and subtitle stream from the input and map it to the output.

Explanation:

* `-c` sets the encoder (see `ffmpeg -encoders`)
* `-c copy` only copies bitstream
* `-c:v` sets only video encoders
* `-c:a` sets only audio encoders
* `-an` and `-vn` would disable audio or video streams

---

## Transcoding Background

From http://ffmpeg.org/ffmpeg-all.html:

> ffmpeg […] **read[s] input files and get packets** containing encoded data from them. When there are multiple input files, ffmpeg tries to keep them synchronized […].

> Encoded packets are then **passed to the decoder**. […] The **decoder produces uncompressed frames** […] which can be processed further by **filtering** […]. After filtering, the frames are **passed to the encoder**, which encodes them and outputs encoded packets. Finally those are **passed to the muxer**, which writes the encoded packets to the output file.

---

## Seeking and Cutting

Cut a video from timestamp `<start>` for `<duration>`, or until `<end>`:

```bash
ffmpeg -ss <start> -i <input> -t <duration> -c copy <output>
ffmpeg -ss <start> -i <input> -to <end> -c copy <output>
```

Examples:

```bash
ffmpeg -ss 00:01:50 -i <input> -t 10.5 -c copy <output>
ffmpeg -ss 2.5 -i <input> -to 10 -c copy <output>
```

---

## Setting Quality

* The output quality depends on encoder defaults
* Do not just encode without setting any quality level

Possible options (just examples):

* `-b:v` or `-b:a` to set bitrate (e.g., `-b:v 1000K`, `-b:v 8M`)
* `-q:v` or `-q:a` to set fixed-quality parameter (e.g., `-q:a 2` for native AAC encoder)

Encoder-specific options:

* `-crf` to set [Constant Rate Factor](http://slhck.info/video/2017/02/24/crf-guide.html) for libx264/libx265
* `-vbr` to set constant quality for FDK-AAC encoder
* Many many more; see `ffmpeg -h encoder=libx264` for examples

---

## Example: Transcoding to H.264

Constant quality (CRF) encoding:

```bash
ffmpeg -i <input> -c:v libx264 -crf 23 -c:a aac -b:a 128k output.mkv
```

CRF between 18 and 28 looks "good", lower is better.

Two-pass encoding:

```bash
ffmpeg -y -i <input> -c:v libx264 -b:v 8M -pass 1 -c:a aac -b:a 128k -f mp4 /dev/null
ffmpeg -i <input> -c:v libx264 -b:v 8M -pass 2 -c:a aac -b:a 128k output.mp4
```

(Windows: Use `NUL` instead of `/dev/null`)

See https://trac.ffmpeg.org/wiki/Encode/H.264

---

## Speed vs. Quality

(Lossy) encoding is always a trade-off between:

* Speed
* Quality
* File size

For example:

* You can have fast, high-quality encoding, but the file will be large
* You can have high-quality, smaller file size, but the encoding will take longer
* You can have small files with fast encoding, but the quality will be bad

---

## Speed/Quality Presets in x264

Choose the encoding speed for libx264 with the `preset` option:

```bash
ffmpeg -i <input> -c:v libx264 -crf 23 -preset ultrafast -an output.mkv
ffmpeg -i <input> -c:v libx264 -crf 23 -preset medium -an output.mkv
ffmpeg -i <input> -c:v libx264 -crf 23 -preset veryslow -an output.mkv
```

All presets: `ultrafast`, `superfast`, `veryfast`, `faster`, `fast`, `medium`, `slow`, `slower`, `veryslow`

Example results (all have the same quality!):

Preset | Encoding Time | File Size
-------|---------------|----------
ultrafast | 4.85s | 15M
medium | 24.13s | 5.2M
veryslow | 112.23s | 4.9M

---

## Changing Framerate

Simple way to change the framerate by dropping or duplicating frames:

```bash
ffmpeg -i <input> -r 24 <output>
```

More complex ways involve filtering, see `fps`, `mpdecimate`, `minterpolate` filters.

---

## Simple Filtering

ffmpeg has lots of video, audio, subtitle filters:

```bash
ffmpeg -i <input> -filter:v <filter1>,<filter2>,<filter3> <output>
```

A `<filter>` has a name and several options, and some pre-defined variables:

```bash
 -filter:v <name>=<option1>=<value1>:<option2>=<value2>
```

Notes:

* You can use `-filter:a` for audio filters.
* See all filters with `ffmpeg -filters`
* Check http://trac.ffmpeg.org/wiki/FilteringGuide and http://ffmpeg.org/ffmpeg-filters.html

---

## Scaling

Scale to 320×240:

```bash
ffmpeg -i <input> -vf scale=w=320:h=240 <output>
```

Scale to a height of 240 and keep aspect ratio divisible by 2:

```bash
ffmpeg -i <input> -vf scale=w=-2:h=240 <output>
```

Scale to 1280×720 or smaller if needed:

```bash
ffmpeg -i <input> -vf scale=1280:720:force_original_aspect_ratio=decrease <output>
```

More tips:

* http://trac.ffmpeg.org/wiki/Scaling%20(resizing)%20with%20ffmpeg
* https://superuser.com/questions/547296/

---

## Padding

TODO

---

## Complex Filtering

TODO

---

## Calculating Simple Quality Metrics

* PSNR

TODO

SSIM:

```bash
ffmpeg -i <degraded> -i <reference> -filter_complex ssim -f null /dev/null
```

Optionally add: `2>&1 | grep SSIM`

---

## Exercise No. 1

* Use two-pass encoding to transcode a sample video to H.264
* Choose a suitable target bitrate (e.g. 4.5 MBit/s for Full HD)
* Encode the video with different speed presets for `libx264`

Questions:

* How long does the encoding take for a given speed preset?

  *Hint: On Linux you can use the `time` command*

* What is the quality of the encoded videos?

  *Hint: You can use the built-in `ssim` filter as a rough measure*

---

## Exercise No. 2

TODO Scaling

---

# Getting media information with `ffprobe`

---

## General syntax

---

## Practical examples

---

## Parsing stream info from files

+ Number of streams
+ Duration
+ Bitrates

---

## Per-frame information

+ Frame types and sizes
+ Coding-related parameters

---

## Exercises

---

# Inspecting video codecs

---

## FFmpeg debug options

+ Debugging motion vectors
+ Debugging macroblock types

---

## Modern video stream analyzers

+ https://arewecompressedyet.com/analyzer/

