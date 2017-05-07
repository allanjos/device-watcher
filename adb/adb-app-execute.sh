#!/bin/sh

source adb/config.sh

usage() {
    echo ""
    echo "Usage:"
    echo "Remove App and install APK"
    echo "adb/adb-app-execute.sh <app.namespace> <app.namespace.activity>"
    echo ""
}

#$ADB devices | grep 'device$' | awk '{ print $1 }'

if [ -z $1 ]; then
    echo Namespace was not informed.
    usage
    exit 1
fi

if [ -z $2 ]; then
    echo Activity to executed was not informed.
    usage
    exit 1
fi

APP_NAMESPACE=$1
APP_ACTIVITY=$2

echo Application namespace: $APP_NAMESPACE
echo Application activity to execute: $APP_ACTIVITY

$ADB shell am start -n $APP_NAMESPACE/$APP_ACTIVITY
