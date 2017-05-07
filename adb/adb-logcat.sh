#!/bin/sh

usage() {
    echo ""
    echo "adb-logcat.sh <filter>"
    echo ""
}

source adb/config.sh

FILTER=$1

echo Filter: $FILTER

if [ "$FILTER" == "" ]; then
    $ADB logcat -d
else
    if [ "$FILTER" == "-h" ]; then
        usage
    else
        $ADB logcat -d | grep $FILTER
    fi
fi
