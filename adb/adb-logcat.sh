#!/bin/sh

usage() {
    echo ""
    echo "adb-logcat.sh <filter>"
    echo ""
}

source adb/config.sh

source adb/adb-list.sh

FILTER=$1

echo Filter: $FILTER

if [ "$FILTER" == "" ]; then
    $ADB -s $ADB_DEVICE logcat -d
else
    if [ "$FILTER" == "-h" ]; then
        usage
    else
        $ADB -s $ADB_DEVICE logcat -d | grep $FILTER
    fi
fi
