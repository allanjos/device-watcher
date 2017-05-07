#!/bin/sh

source adb/config.sh

usage() {
    echo ""
    echo "Usage:"
    echo "Remove App and install APK"
    echo "adb/adb-apk-install.sh <APK file path> <App namespace>"
    echo "Install:"
    echo "adb/adb-apk-install.sh <APK file path>"
    echo ""
}

#$ADB devices | grep 'device$' | awk '{ print $1 }'

if [ -z $1 ]; then
    usage
    exit 1
fi

APK_PATH=$1

echo APK to install: $APK_PATH

if [ ! -z $2 ]; then
    NAMESPACE=$2

    echo App namespace: $NAMESPACE

    # Uninstalling application

    echo Uninstalling $NAMESPACE

    $ADB uninstall $NAMESPACE
fi

# Install APK

echo Installing application $APK_PATH

$ADB install -f $APK_PATH
