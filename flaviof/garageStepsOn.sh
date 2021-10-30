#!/bin/bash

#set -o xtrace
set -o errexit

MQTT='-h 192.168.10.238'
STEPS='/garage_steps/set_light_mode /kitchen_steps/set_light_mode'
# TIMEOUT="1800" ; # 30 mins
TIMEOUT="14400" ; # 4 hours

# ref: https://stackoverflow.com/questions/35623462/bash-select-random-string-from-list
# dance1
cmds[0]="dot,strip=0,red=127,value=0,oper=not2,waveOn=true,clearPixels=true"
cmds[0]="${cmds[0]} dot,strip=1,green=127,value=0,oper=not2,waveOn=true"
cmds[0]="${cmds[0]} dot,strip=2,blue=127,value=0,oper=not2,waveOn=true"

# dance 2
cmds[1]="blink,slowScale=1,randomColor,perStrip"

# dance 3
cmds[2]="blink,slowScale=1,randomColor"

# scan
cmds[3]="scan,randomColor,pixelIncrement=13"

# scan 2
cmds[4]="scan,noWrap,pixelIncrement=3"

# rainbow
cmds[5]="rainbow,fast"

# blue
cmds[6]="fill,blue=127"

# red
cmds[7]="fill,red=127"

# cyan
cmds[8]="fill,blue=127,green=127"

# yellow
cmds[9]="fill,red=127,green=127"

# hack to check that variable is a number
# http://stackoverflow.com/questions/806906/how-do-i-test-if-a-variable-is-a-number-in-bash

size=${#cmds[@]}
index=$(($RANDOM % $size))
[ -n "$1" ] && [ "$1" -eq "$1" ] && index=$(($1 % $size))

onStr=$2
if [ -z "${onStr}" ]; then
    onStr=$index
fi

# echo ${cmds[$index]}
for S in $STEPS ; do \
    for SUBCMD in ${cmds[$index]} ; do \
        mosquitto_pub $MQTT -t $S -m "mode=${SUBCMD},timeout=${TIMEOUT}"
        sleep 0.1
    done
done
echo "$index $onStr" > /tmp/garageStepsOn
exit 0
