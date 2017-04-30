#!/bin/sh

systemctl stop systemd-udevd.service
systemctl stop systemd-udev-trigger.service
systemctl stop systemd-udev-settle.service

systemctl start systemd-udevd.service
systemctl start systemd-udev-trigger.service
systemctl start systemd-udev-settle.service
