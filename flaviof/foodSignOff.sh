#!/bin/bash

# set -o xtrace
set -o errexit

urlBase='http://192.168.10.236:80'
urlLedStrip="${urlBase}/ledStrip"
urlDict="${urlBase}/dictionary"

curl --request POST ${urlLedStrip} --data 'ledStripMode=0&timeout=1&clearPixels=1'
curl --request POST ${urlDict} \
  --data-urlencode 'dictionaryOperation=del' \
  --data-urlencode 'dictionaryKey=ledStripStatus'
