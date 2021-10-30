#!/bin/bash

# set -o xtrace
set -o errexit

colorStr=$1
if [ -z "${colorStr}" ]; then
    colorStr=blue
fi

urlBase='http://smokey:8080'

STATUS_DATA=$(curl --location --silent --request GET "${urlBase}/state")
echo ${STATUS_DATA} | /usr/bin/jq ".OperStateParsed.LightOn" | grep -q true || exit 1
echo ${STATUS_DATA} | /usr/bin/jq ".WantedState.LightModeName" | grep -q sunshine || exit 1
echo ${STATUS_DATA} | /usr/bin/jq ".WantedState.LightColorName" | grep -q "$colorStr" || exit 1

exit 0

