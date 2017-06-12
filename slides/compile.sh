#!/usr/bin/env bash

# Required:
# npm install -g reveal-md
# npm install -g phantomjs

in="ffmpeg-encoding-course"
# reveal-md "$in.md" --print "$in.pdf"
reveal-md "$in.md" --static
reveal-md "$in.md" -w

# # Alternative:
# # See: https://github.com/jgm/pandoc/wiki/Using-pandoc-to-produce-reveal.js-slides
# pandoc -o ffmpeg-encoding-course.html -s -t revealjs \
#     -V theme=white \
#     -V slideNumber=true \
#     ffmpeg-encoding-course.md