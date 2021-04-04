#!/bin/bash

set -o errexit
#set -x

cd "$(dirname $0)"
BIN_DIR="$(pwd -P)"
TOP_DIR="${BIN_DIR%/*}"

cd ${TOP_DIR}/.env
source ./bin/activate
cd ${TOP_DIR} && fauxmo -vv -c flaviof/config.json $@

exit 0
