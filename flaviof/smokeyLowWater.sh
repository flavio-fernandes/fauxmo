#!/bin/bash

set -o xtrace
set -o errexit

urlBase='http://smokey:8080'

curl --location --request GET "${urlBase}/water"
echo