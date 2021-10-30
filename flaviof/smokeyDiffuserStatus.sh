#!/bin/bash

# set -o xtrace
set -o errexit

urlBase='http://smokey:8080'

STATUS_DATA=$(curl --location --silent --request GET "${urlBase}/state")
echo ${STATUS_DATA} | /usr/bin/jq ".OperStateParsed.DiffuserOn" | grep -q true || exit 1
exit 0

