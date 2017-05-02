#!/bin/sh

ADB=/home/allann/pessoal/packages/devel/android/Sdk/platform-tools/adb

echo Getting Android device IP...

DEVICE_IP=$(${ADB} shell ifconfig wlan0 | grep 'inet addr' | sed 's/^.*inet addr:\([^[:space:]]*\).*$/\1/g')

if [ -z $DEVICE_IP ]; then
    echo "Cannot identify an Android device. Connect an Android device to USB and try again."
    exit 1
fi

echo Device IP: $DEVICE_IP

echo Changing ADB to TCP/IP mode...

$ADB tcpip 5555

echo Waiting...

sleep 5

echo Connecting to Android device through TCP/IP mode...

$ADB connect $DEVICE_IP:5555

echo Finished.

echo DISCONNECT THE ANDROID DEVICE FROM USB...

sleep 10

$ADB connect $DEVICE_IP:5555
