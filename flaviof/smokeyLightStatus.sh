#!/bin/bash

# set -o xtrace
set -o errexit

urlBase='http://smokey:8080'

STATUS_DATA=$(curl --location --silent --request GET "${urlBase}/state")
echo ${STATUS_DATA} | /usr/bin/jq ".OperStateParsed.LightOn" | grep -q true || exit 1
echo ${STATUS_DATA} | /usr/bin/jq ".WantedState.LightModeName" | grep -q solid || exit 1

[ -z "$1" ] && exit 0
echo ${STATUS_DATA} | /usr/bin/jq ".WantedState.LightColorName" | grep -q "$1" && exit 0
exit 1

