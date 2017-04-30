#!/bin/sh

while true
     do
       if FN=`inotifywait -e close_write,moved_to --format %f /tmp/device/android-device-log.txt`
        then
          cat $FN
       fi
done
