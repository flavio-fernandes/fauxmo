#!/bin/bash

# set -o xtrace
set -o errexit

colorStr=$1
if [ -z "${colorStr}" ]; then
    colorStr=blue
fi

urlBase='http://smokey:8080'

curl --location --request POST "${urlBase}/lighton" \
  --header 'Content-Type: application/x-www-form-urlencoded' \
  --data-urlencode 'autoOffSecs=3600' \
  --data-urlencode 'mode=sunshine' \
  --data-urlencode "color=${colorStr}"
