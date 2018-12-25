#!/usr/bin/env bash

### BEGIN ###
# Author: idevz
# Since: 15:04:35 2018/12/18
# Description:       default httpserver
# http-server          ./http-server
#
# Environment variables that control this script:
#
### END ###

set -e
BASE_DIR=${BASE_DIR:-"$(readlink -f "$(dirname "$0")")"}

python3 -m http.server --directory "${BASE_DIR}/html/" &
