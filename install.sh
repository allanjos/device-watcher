#!/bin/sh

# Path for scripts executed on device events

SCRIPTS_LOG_PATH=/tmp/device

echo Creating directory to install device scripts in $SCRIPTS_LOG_PATH

if [ ! -e $SCRIPTS_LOG_PATH ]; then
    mkdir $SCRIPTS_LOG_PATH
fi

echo Creating log file...

if [ ! -e $SCRIPTS_LOG_PATH/android-device-log.txt ]; then
    touch $SCRIPTS_LOG_PATH/android-device-log.txt
fi

# Install scripts executed on device events

echo Installing device scripts...

cp logger/device_plug.sh $SCRIPTS_LOG_PATH
cp logger/device_unplug.sh $SCRIPTS_LOG_PATH

# Install udev rules

echo Installing udev rules...

cp ./udev/81-udev-notify.rules /etc/udev/rules.d/

# Restart udev

echo Restarting udev...

sh ./udev/udev-reload.sh

# For Fedora (uneeded)
# udev/fedora-udev-restart.sh

echo Installation finished.
