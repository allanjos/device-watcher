#!/bin/sh

source adb/config.sh

source adb/adb-list.sh

usage() {
    echo ""
    echo "Usage:"
    echo "Remove App and install APK"
    echo "adb/adb-apk-install.sh <APK file path> <App namespace>"
    echo "Install:"
    echo "adb/adb-apk-install.sh <APK file path>"
    echo ""
}

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

    $ADB -s $ADB_DEVICE uninstall $NAMESPACE
fi

# Install APK

echo Installing application $APK_PATH

$ADB -s $ADB_DEVICE install -f $APK_PATH
