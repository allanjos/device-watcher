#!/bin/sh

FS_PATH_TO_MONITOR=/tmp/device/android-device-log.txt

EVENT=$(inotifywait --format '%e' $FS_PATH_TO_MONITOR)
echo Event: $EVENT

[ $? != 0 ] && exit
[ "$EVENT" = "MODIFY" ] && echo 'EVENT: MOFIFY'
[ "$EVENT" = "CREATE" ] && echo 'EVENT: CREATE'
[ "$EVENT" = "DELETE_SELF" ] && echo 'EVENT: DELETE_SELF'
