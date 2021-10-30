#!/bin/bash

# set -o xtrace
set -o errexit

urlBase='http://smokey:8080'

STATUS_DATA=$(curl --location --silent --request GET "${urlBase}/water")

echo ${STATUS_DATA} | grep -q low && exit 0
exit 1
