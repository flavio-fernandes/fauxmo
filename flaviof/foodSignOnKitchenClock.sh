#!/bin/bash

# set -o xtrace
set -o errexit

mosquitto_pub -h 192.168.10.238 -t '/kitchen_clock/img' -m '{"timeout":"14","img":"cat"}' ||:
sleep 14
mosquitto_pub -h 192.168.10.238 -t '/kitchen_clock/msg' -m '{"msg": "Food time!", "text_color": "#0x595dff", "timeout": 13}' ||:
