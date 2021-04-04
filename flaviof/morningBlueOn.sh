#!/bin/bash

# set -o xtrace
set -o errexit

urlBase='http://192.168.10.236:80'
urlLedStrip="${urlBase}/ledStrip"
urlDict="${urlBase}/dictionary"

curl --request POST ${urlLedStrip} --data 'ledStripMode=2&timeout=7200&blue=65&red=0&from=164&to=240' && \
curl --request POST ${urlLedStrip} --data 'ledStripMode=2&timeout=7200&blue=127&red=127&green=127&from=163&to=163' && \
curl --request POST ${urlDict} \
  --data-urlencode 'dictionaryTimeout=7200000' \
  --data-urlencode 'dictionaryOperation=set' \
  --data-urlencode 'dictionaryKey=ledStripStatus' \
  --data-urlencode 'dictionaryData=morningBlueOn'


