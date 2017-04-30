#!/bin/sh

FS_PATH_TO_MONITOR=/tmp/device/android-device-log.txt

inotifywait -mr --timefmt '%d/%m/%y %H:%M' --format '%T %w %f' \
  -e close_write $FS_PATH_TO_MONITOR | while read date time dir file; do
       echo "At ${time} on ${date}, file ${dir}${file} was changed"
       tail -n 1 $FS_PATH_TO_MONITOR
done
