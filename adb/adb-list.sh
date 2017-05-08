#!/bin/sh

source adb/config.sh

OUTPUT_DEVICES=`$ADB devices | grep 'device$' | awk '{ print $1 }'`

INDEX=0
for i in ${OUTPUT_DEVICES[@]}; do
    echo Device $INDEX: $i

    DEVICES_LIST[$INDEX]=$i

    let INDEX=INDEX+1
done

DEVICES_COUNT=${#DEVICES_LIST[@]}

echo Number of devices: $DEVICES_COUNT

if [ $DEVICES_COUNT -lt 1 ]; then
    echo ERROR: There is no devices
    exit 1
fi

ADB_DEVICE=${DEVICES_LIST[0]}

echo Default device: $ADB_DEVICE
