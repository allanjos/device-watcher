#!/bin/sh

source adb/config.sh

$ADB devices | grep 'device$' | awk '{ print $1 }'
