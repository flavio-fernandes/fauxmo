#!/bin/bash

# set -o xtrace
set -o errexit

urlBase='http://192.168.10.236:80'
urlStatus="${urlBase}/status"

STATUS_DATA=$(curl --silent ${urlStatus} | grep -e led_strip_mode -e ledStripStatus)
echo ${STATUS_DATA} | grep -q scan || exit 1
echo ${STATUS_DATA} | grep -q foodSignOn || exit 1
exit 0


# not scan mode means food sign is not on
exit 1
