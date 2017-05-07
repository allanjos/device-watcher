#!/bin/sh

source adb/config.sh

usage() {
    echo ""
    echo "Usage:"
    echo "Uninstall APK"
    echo "adb/adb-apk-uninstall.sh <App namespace>"
    echo ""
}

#$ADB devices | grep 'device$' | awk '{ print $1 }'

if [ -z $1 ]; then
    usage
    exit 1
fi

APP_NAMESPACE=$1

echo Namespace to uninstall: $APP_NAMESPACE

# Uninstalling application

echo Uninstalling $APP_NAMESPACE

$ADB uninstall $APP_NAMESPACE
