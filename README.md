# FFmpeg Encoding and Editing Course

Author: Werner Robitza

This course is a 1.5 hour introduction to FFmpeg and its tools, basic video coding technology, and some hands-on examples. It contains all the slides, scripts and demo material to get started.

Access the slides here: http://slhck.info/ffmpeg-encoding-course/

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

MIT License (c) 2017, see LICENSE for more.

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

To convert them to a PDF, install [Decktape](https://github.com/astefanutti/decktape):

    curl -L https://github.com/astefanutti/decktape/archive/v1.0.0.tar.gz | tar -xz --exclude phantomjs
    cd decktape-1.0.0

Then install the PhandomJS fork:

    # Windows (MSVC 2013), for Windows Vista or later, bundles VC++ Runtime 2013
    $ curl -L https://github.com/astefanutti/decktape/releases/download/v1.0.0/phantomjs-msvc2013-x86.exe -o phantomjs.exe
    # Mac OS X (Cocoa), 64-bit, for OS X 10.6 or later
    $ curl -L https://github.com/astefanutti/decktape/releases/download/v1.0.0/phantomjs-osx-cocoa-x86-64 -o phantomjs
    # Linux (static build), 64-bit, requires fontconfig (CentOS) or libfontconfig (Debian, Ubuntu)
    $ curl -L https://github.com/astefanutti/decktape/releases/download/v1.0.0/phantomjs-linux-x86-64 -o phantomjs
    # Make executable:
    chmod +x phantomjs

Then convert to PDF:

    ./phantomjs decktape.js reveal "http://localhost:1948/ffmpeg-encoding-course.md#/" ffmpeg-encoding-course.pdf