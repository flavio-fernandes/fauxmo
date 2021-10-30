#!/bin/bash

# set -o xtrace
set -o errexit

[ -e /tmp/garageStepsOn ] || exit 1

[ -z "$1" ] && exit 0
grep -q "$1" /tmp/garageStepsOn && exit 0

exit 1
