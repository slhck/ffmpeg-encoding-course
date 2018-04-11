## Exercise 1

<!-- .slide: data-background-color="#660000" -->

Tasks:

* Download a PNG image from the Web
* Run the following command:

        ffmpeg -loop 1 -i <image> -t 5 output.mp4

Questions:

* What codec and encoder are auto-selected for the output file?
* What pixel format is auto-selected by ffmpeg?
* Why do you think this is done?

## Exercise 2 – Pt. 1

<!-- .slide: data-background-color="#660000" -->

* Take an original 1920×1080 video file
* Cut it to 5 seconds length and downscale it to a height of 240 pixels
* Keep the same aspect ratio, keep the original audio stream without re-encoding.
* Take the downscaled version of the video and append it to the original video by concatenating, and encode the final file with a lossless codec of your choice
    * *Hint: You have to first upscale it again*
    * Bonus points if you can do this in one command

---

## Exercise 2 – Pt. 2

<!-- .slide: data-background-color="#660000" -->

Questions:

* How do you make ffmpeg find out the output width?
* What is the final output width? What should the output width have been according to math?
* Why are these values sometimes different?
* Why do you have to upscale the video again when you concatenate it?

---

## Exercise 3 – Pt. 1

<!-- .slide: data-background-color="#660000" -->

Tasks:

* Use two-pass encoding to transcode the sample video to H.264 with x264
* Use the following bitrates: 1M, 2M, 4M, 6M, 8M
* Encode the video with all existing speed presets for `libx264` and all chosen bitrates.

Hints:

* This may take some time overall depending on your CPU speed
* *Bonus points if you can write a simple Batch or Bash script rather than type all the commands*

---

## Exercise 3 – Pt. 2

<!-- .slide: data-background-color="#660000" -->

Questions:

1. How long does the encoding take for a given speed preset, on average?
2. For every target bitrate, draw a curve that shows the time taken (y-axis) vs. preset used (x-axis). (*Bonus points if you overlay the curves on top of each other in one plot, e.g. through different colors.*)
3. Do you see a difference in quality between the encoded clips?
4. Calculate a quality measure for the encoded videos with the different presets.
5. For every target bitrate, draw a curve that shows the quality (y-axis) vs. preset used (x-axis). (*Bonus points if you overlay the curves on top of each other in one plot, e.g. through different colors.*)

Hints:

* You can use the built-in `ssim` filter as a rough measure for quality
* On Linux you can use the `time` command, on Windows this is a little harder (do a web search)
* This can be done with Excel, but other tools like Python or R are useful as well

---