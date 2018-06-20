# FFmpeg Encoding and Editing Course

Author: Werner Robitza

This course is a 1.5 hour introduction to FFmpeg and its tools, basic video coding technology, and some hands-on examples. It contains all the slides, scripts and demo material to get started.

Access the slides here: https://slhck.info/ffmpeg-encoding-course/

# Course Contents

- Introduction to FFmpeg
- General Video Encoding Concepts
- Encoding with the `ffmpeg` Command Line Tool
- Getting media information with `ffprobe`
- Inspecting Video Codecs

# Requirements

- This repository
- ffmpeg (≥ v3.3.2) with libx264, libx265, libvpx
- ffprobe
- ffplay
- [Big Buck Bunny](http://distribution.bbb3d.renderfarming.net/video/mp4/bbb_sunflower_1080p_60fps_normal.mp4) video (339 MB)

# License

MIT License (c) 2017-2018, see LICENSE for more.

---

# Slides

The slides in `slides/` are written in Markdown and can be converted to Reveal.js slides:

    npm install -g reveal-md
    cd slides/
    reveal-md ffmpeg-encoding-course.md

This will open a browser and show your slides at `http://localhost:1948/ffmpeg-encoding-course.md#/`.

## Converting to Static

To convert the slides to a static site:

    reveal-md ffmpeg-encoding-course.md --static ../docs

This static site in `docs` will be shown via GitHub Pages.

## Converting to PDF

To convert them to a PDF, run:

    reveal-md ffmpeg-encoding-course.md --print ffmpeg-encoding-course.pdf