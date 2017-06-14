# FFmpeg Encoding and Editing Course

Author: Werner Robitza

This course is a 1.5 hour introduction to FFmpeg and its tools, basic video coding technology, and some hands-on examples. It contains all the slides, scripts and demo material to get started.

# Requirements

- This repository
- ffmpeg (≥ v3.3.2) with libx264, libx265, libvpx
- ffprobe
- ffplay
- [Big Buck Bunny](http://distribution.bbb3d.renderfarming.net/video/mp4/bbb_sunflower_1080p_60fps_normal.mp4) video (339 MB)

# Course Contents

* General Introduction
    - About me
    - Goals
    - Requirements
* Introduction to FFmpeg
    - About the project
    - About the libraries (`libav*`)
    - Installation / Compilation
    - Getting help (Wiki, IRC, mailing list, Stack Overflow)
* General concepts
    - Container formats (AVI, MKV, MP4, …)
    - Codecs (H.264, H.265, VP9, AV1, …)
    - Encoders (x264, x265, libvpx, libaom, …)
    - Pixel formats
* Encoding with the `ffmpeg` command line tool
    - General syntax
    - Transcoding
        + General considerations
        + Setting quality
        + Practical examples
          * Encoding to H.264/H.265/VP9
          * Encoding a set of images
    - Filtering
        + Practical examples
            * Visualization
            * Re-scaling and padding
            * Framerate changes
* Getting media information with `ffprobe`
    - General syntax
    - Practical examples
    - Parsing stream info from files
        + Number of streams
        + Duration
        + Bitrates
    - Per-frame information
        + Frame types and sizes
        + Coding-related parameters
* Inspecting video codecs
    - FFmpeg debug options
        + Debugging motion vectors
        + Debugging macroblock types
    - Modern video stream analyzers
        + https://arewecompressedyet.com/analyzer/