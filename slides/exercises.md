# FFmpeg Exercises

You may go through these exercises and provide your answers in a short written report, using figures where necessary. You may supply your data in an Excel sheet, for example, in order to make the results more reproducible.

Overall, this should take a few hours, and in the end you will have learned to use ffmpeg to re-encode, cut, scale, and concatenate video. And you will know how to achieve different quality targets at different speeds.

## Exercise 1

Tasks:

* Download a PNG image from the Web
* Run the following command:

        ffmpeg -loop 1 -i <image> -t 5 output.mp4

* Inspect the output log that ffmpeg gives you

Questions:

1. What happens with the image?
2. How long is the output file?
3. How many frames does the output file have?
4. What codec and encoder are auto-selected for the output file?
5. What pixel format is auto-selected by ffmpeg for the output file?
6. Can you play the output file in a regular media player (e.g. Windows Media Player or QuickTime)? Can you play it in VLC?

Takeaways:

* → The ffmpeg log can be used to find information about input and output files
* → Compatibility for different codecs, containers, and also codec settings differ between video players

## Exercise 2

Here we will learn about cutting and concatenating.

### Step 1

* Take an original 1920×1080 video file (you may use the example "Big Buck Bunny" file provided), let's call it `input.mp4`.
* Create an ffmpeg command that cuts the video `input.mp4`. The following must be done:
    * The cut shoult start after 10 seconds and the total duration should be 5 seconds
    * The video should be re-encoded using `libx264`
    * The audio stream should be copied
    * The output must be named `output-01.mp4`

Questions:

1. How do you specify the in and out points for the cut?
2. What options are needed to specify the encoder, or copying?

### Step 2

* Re-use the previous command
* Take the `output-01.mp4` file as an input file
* To the command, add the necessary filter to:
    * Scale the input video to a height of 240 pixels
    * Keep the same aspect ratio as the original video
    * Also, keep the original audio stream without re-encoding
* The output must be named `output-02.mp4`

Questions:

1. How did you calculate the aspect ratio and the output width?
2. When you want to keep the aspect ratio, how do you make ffmpeg find out the output width automatically?
3. What is the final output width that ffmpeg calculates? What should the *actual* output width have been according to math?
4. Why are these values sometimes different?

### Step 3

* Take the downscaled version of the video (`output-02.mp4` from Step 2) and append it to the output from Step 1 (`output-01.mp4`) video by concatenating.
* Encode the final file with a lossless codec of your choice to (`output-final.avi`)
* *Hints:*
    * When you concatenate two videos, you must make sure that they have the same pixel dimensions, so you need to upscale the `output-02.mp4` video to the first video dimensions
    * You may use the `concat` filter in ffmpeg
    * Bonus points if you can do both the scaling and concatenating in one command

Questions:

1. Why do you think is it necessary to upscale the second video again when you concatenate it with the first?

Takeaways:

* → ffmpeg can be used for programmatically cutting video
* → You can stitch together various parts of the video

## Exercise 3

Here we will try to achieve different quality outputs and measure encoding speed.

### Step 1

* Use two-pass encoding to transcode the sample video to H.265 with x265
* Use the following bitrates: 1M, 2M, 4M, 6M, 8M
* Encode the video with all existing speed presets for `libx265` and all chosen bitrates. (You may find the possible presets [here](https://x265.readthedocs.io/en/default/presets.html#presets).)

Hints:

* This may take some time overall depending on your CPU speed
* *Bonus points if you can write a simple Batch or Bash (or Python, Java, whatever you want) script rather than type all the commands by hand!*

Questions:

1. How long does the encoding take for a given speed preset, on average? (Hint: On Linux you can use the `time` command, on Windows this is a little harder (do a web search))
2. Please think about a practical case: When would it be more important to encode a video fast, at lower quality, or vice-versa? When would it be more important to get a lower bitrate rather than encoding the video fast?

### Step 2

* For every target bitrate, draw a curve that shows the time taken (y-axis) vs. preset used (x-axis). (Hint: This can be done with Excel, but other tools like Python or R are useful as well.)
* *Bonus points if you overlay the curves on top of each other in one plot, e.g. through different colors.*

Questions:

1. Do you see a difference in quality between the encoded clips at different bitrates, when you watch them?
2. If not, do you see a difference when you compare individual frames, one by one?

### Step 3

* Calculate a quality measure/metric for the encoded videos with the different presets and bitrates. (Hint: You can use the built-in `ssim` filter as a rough measure for quality.)
* For every target bitrate, draw a curve that shows the quality (y-axis) vs. preset used (x-axis).
* *Bonus points if you overlay the curves on top of each other in one plot, e.g. through different colors.*
