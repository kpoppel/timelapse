#!/bin/bash
# Configuration
# Set time between saving images from the camera
TIMELAPSE="+6 minutes"
# Set the coordinates from which to calculate Sun set/rise
COORDINATES="55.5386934N 11.3729296E"
# Set the URL to IP Camera as stated on the phone.
IPCAMURL="http://172.0.3.23:8080"

# The rest...
until [ 1 == 0 ]
do
 TIME_NEXT=$(date -d "$TIMELAPSE" +%s)
 echo "Time for next image: "$TIME_NEXT
 # sunwait returns 2 if day, 3 if night
 ./sunwait poll civil $COORDINATES
 DAYORNIGHT=$?
 TIMESTAMP=`date +%F_%H%M`
 if [ $DAYORNIGHT == 2 ]; then
   # Day
   wget $IPCAMURL/photoaf.jpg -O ${TIMESTAMP}.jpg
 else
   echo $TIMESTAMP"- Still night (status="$DAYORNIGHT")"
 fi
 TIME_NOW=$(date +%s)
 # Calculate time to sleep
 difference=$(expr $TIME_NEXT - $TIME_NOW)
 echo "Sleeping: "$difference
 sleep $difference
done
