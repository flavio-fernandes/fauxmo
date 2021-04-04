#!/bin/bash

if [ -z "$1" ]; then
    sudo journalctl -u fauxmo.service --no-pager --follow
else
    sudo tail -F /var/log/syslog | grep fauxmo
fi
