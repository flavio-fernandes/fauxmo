#!/bin/bash

#set -o xtrace
set -o errexit

MQTT='-h 192.168.10.238'
STEPS='/garage_steps/set_light_mode /kitchen_steps/set_light_mode'

for S in $STEPS ; do \
    mosquitto_pub $MQTT -t $S -m 'mode=off'
done
rm -f /tmp/garageStepsOn
exit 0
