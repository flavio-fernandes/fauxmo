#!/bin/bash

# set -o xtrace
set -o errexit

autoOffSecs=$1
if [ -z "${autoOffSecs}" ]; then
    autoOffSecs=3600
fi

urlBase='http://smokey:8080'

curl --location --request POST "${urlBase}/lighton" \
  --header 'Content-Type: application/x-www-form-urlencoded' \
  --data-urlencode "autoOffSecs=${autoOffSecs}" \
  --data-urlencode 'mode=crazy'

curl --location --request POST "${urlBase}/smokeon" \
  --header 'Content-Type: application/x-www-form-urlencoded' \
  --data-urlencode "autoOffSecs=${autoOffSecs}"
