#!/bin/bash

# set -o xtrace
set -o errexit

colorStr=$1
if [ -z "${colorStr}" ]; then
    colorStr=random
fi

dimStr=$2

autoOffSecs=$3
if [ -z "${autoOffSecs}" ]; then
    autoOffSecs=7200
fi

urlBase='http://smokey:8080'

curl --location --request POST "${urlBase}/lighton" \
  --header 'Content-Type: application/x-www-form-urlencoded' \
  --data-urlencode "autoOffSecs=${autoOffSecs}" \
  --data-urlencode 'mode=solid' \
  --data-urlencode "color=${colorStr}"

if [ -n "${dimStr}" ]; then
curl --location --request POST "${urlBase}/lightdim" \
  --header 'Content-Type: application/x-www-form-urlencoded' \
  --data-urlencode "dim=${dimStr}"
fi
