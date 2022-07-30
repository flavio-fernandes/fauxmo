#!/bin/bash

# set -o xtrace
set -o errexit

colorStr=$1
if [ -z "${colorStr}" ]; then
    colorStr=blue
fi

/home/ff/mqtt2alexa/fauxmo.git/flaviof/smokeyOn.sh 1500

urlBase='http://smokey:8080'

curl --location --request POST "${urlBase}/lighton" \
  --header 'Content-Type: application/x-www-form-urlencoded' \
  --data-urlencode 'autoOffSecs=5400' \
  --data-urlencode 'mode=sunshine' \
  --data-urlencode "color=${colorStr}"

