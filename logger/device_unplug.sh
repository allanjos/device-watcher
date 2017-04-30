DATETIME=`date "+%Y-%m-%d %H:%M:%S"`
DEVICE_SCRIPTS_PATH=/tmp/device
FILE_LOG_OUTPUT=$DEVICE_SCRIPTS_PATH/android-device-log.txt

#zenity --error --text 'Device plugged'
echo "DEV REMOVED $DATETIME" >> $FILE_LOG_OUTPUT
