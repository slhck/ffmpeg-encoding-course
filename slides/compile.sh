#!/usr/bin/env bash
# See: https://github.com/jgm/pandoc/wiki/Using-pandoc-to-produce-reveal.js-slides
pandoc -o ffmpeg-encoding-course.html -s -t revealjs ffmpeg-encoding-course.md
