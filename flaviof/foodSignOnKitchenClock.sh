#!/bin/bash

# set -o xtrace
set -o errexit

img[0]="cat"
img[1]="fireworks"
img[2]="hop"
img[3]="parrot"
img[4]="rings"
img[5]="ruby"
img[6]="sine"
rand_img=$[$RANDOM % ${#img[@]}]

img_json=$(jq -c -n -r \
       --arg timeout "14" \
       --arg img "${img[$rand_img]}" \
       '{timeout: $timeout, img: $img}'
      )

mosquitto_pub -h 192.168.10.238 -t '/kitchen_clock/img' -m "${img_json}" ||:
sleep 14
mosquitto_pub -h 192.168.10.238 -t '/kitchen_clock/msg' -m '{"msg": "Food time!", "text_color": "#0x595dff", "timeout": 13}' ||:
