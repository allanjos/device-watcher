#!/bin/sh

source adb/config.sh

source adb/adb-list.sh

usage() {
    echo ""
    echo "Usage:"
    echo "Uninstall APK"
    echo "adb/adb-apk-uninstall.sh <App namespace>"
    echo ""
}

if [ -z $1 ]; then
    usage
    exit 1
fi

APP_NAMESPACE=$1

echo Namespace to uninstall: $APP_NAMESPACE

# Uninstalling application

echo Uninstalling $APP_NAMESPACE

$ADB -s $ADB_DEVICE uninstall $APP_NAMESPACE
