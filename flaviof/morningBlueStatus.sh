#!/bin/bash

# set -o xtrace
set -o errexit

urlBase='http://192.168.10.236:80'
urlStatus="${urlBase}/status"

STATUS_DATA=$(curl --silent ${urlStatus} | grep -e led_strip_mode -e ledStripStatus)
echo ${STATUS_DATA} | grep -q fill || exit 1
echo ${STATUS_DATA} | grep -q morningBlueOn || exit 1
exit 0
