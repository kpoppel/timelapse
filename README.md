# timelapse
A very simple timelapse setup, based off an old smartphone and the IP Webcam (by Pavel Khlebovich) app on the Play store.

# Build and Installation

## Smartphone
First off get one of those old smartphones and install IP Webvam (https://play.google.com/store/apps/details?id=com.pas.webcam&hl=en) on it.

Configure the app as you like. I have configured mine to save images in size 1280x960. This seems like a nice compromise between image size and creating timelapse videos later in 720p quality.

## Script requirements
There are only three requirements:
1) sunwait (https://sourceforge.net/projects/sunwait4windows/)
   - for making smart choices on the Sun setting or rising
2) mencoder (apt get install mencoder)
   - for making videos
3) bash
   - for running the scripts

Just put the sunwait executable in the same directory as the scripts.

## Scripts
There are just two scripts: One for running the timelapse - done is a screen session and one for building a video.

### Configuration of the timelapse script
In the timelapse script you must provide 3 things:
1) The timelapse interval. Default is 6 minutes.
2) The coordinate of the camera. Use Google maps for this, just copy out the coordinates from the Maps URL.
   Example: https://www.google.dk/maps/@*55.5386934,11.3729296*,19.75z
3) URL to the smartphone running the IP Camera app.

## Running
You should be ready now to do a timelapse. Make sure ample space is available, or setup some automatics to move files to large storage over time.
run screen and then simply
$ ./timelapse.sh

If the Sun is still up, you should now get images.
The script will run until terminated.
