#!/bin/bash 
# Run on big macine, not a VM!
mencoder "mf://*.jpg" -mf fps=12:type=jpg -ovc lavc -lavcopts vcodec=mpeg4:mbd=2:trell:vbitrate=7000 -vf scale=1280:720 -oac copy -o movie.avi

# Daily?
#mencoder "mf://20110812*.png" -mf fps=20:type=jpg -ovc lavc -lavcopts vcodec=mpeg4:mbd=2:trell:vbitrate=7000 -vf scale=1280:720 -oac copy -o ../20110812.avi
