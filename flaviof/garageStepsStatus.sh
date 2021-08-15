#!/bin/bash

# set -o xtrace
set -o errexit

[ -e /tmp/garageStepsOn ] && exit 0
exit 1
