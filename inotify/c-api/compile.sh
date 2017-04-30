#!/bin/sh

pushd inotify/motog/

gcc inotify-device.c -o inotify-device -lnotify

popd
