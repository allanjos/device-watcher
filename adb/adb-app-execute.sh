#!/bin/sh

source adb/config.sh

source adb/adb-list.sh

usage() {
    echo ""
    echo "Usage:"
    echo "Remove App and install APK"
    echo "adb/adb-app-execute.sh <app.namespace> <relative.app.namespace.activity>"
    echo ""
}

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

echo Stopping app in namespace $APP_NAMESPACE

$ADB -s $ADB_DEVICE shell am force-stop $APP_NAMESPACE

echo Executing application in namespace $APP_NAMESPACE and activity $APP_NAMESPACE/$APP_ACTIVITY

$ADB -s $ADB_DEVICE shell am start -n $APP_NAMESPACE/$APP_ACTIVITY
