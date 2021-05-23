#!/bin/bash

# set -o xtrace
set -o errexit

urlBase='http://192.168.10.236:80'
urlLedStrip="${urlBase}/ledStrip"
urlDict="${urlBase}/dictionary"

curl --request POST ${urlLedStrip} --data 'ledStripMode=4&timeout=900&red=127' && \
curl --request POST ${urlDict} \
  --data-urlencode 'dictionaryTimeout=900000' \
  --data-urlencode 'dictionaryOperation=set' \
  --data-urlencode 'dictionaryKey=ledStripStatus' \
  --data-urlencode 'dictionaryData=foodSignOn'

nohup $(dirname "$0")/foodSignOnKitchenClock.sh >/dev/null 2>&1 & echo -n
