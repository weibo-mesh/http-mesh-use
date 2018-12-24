#!/usr/bin/env bash

### BEGIN ###
# Author: idevz
# Since: 16:27:46 2018/12/24
# Description:       start the http-mesh demo
# run          ./run.sh r
# run          ./run.sh c
#
# Environment variables that control this script:
#
### END ###

set -e
BASE_DIR=$(pwd)

if [ ${1} = 'r' ]; then
	docker-compose -f ${BASE_DIR}/docker-compose/http-mesh-client.yaml down --remove-orphans
	docker-compose -f ${BASE_DIR}/docker-compose/http-mesh-server.yaml down --remove-orphans
	docker-compose -f ${BASE_DIR}/docker-compose/http-mesh-server.yaml up -d
	docker-compose -f ${BASE_DIR}/docker-compose/http-mesh-client.yaml up -d
elif [ ${1} = 'c' ]; then
	docker-compose -f ${BASE_DIR}/docker-compose/http-mesh-client.yaml down --remove-orphans
	docker-compose -f ${BASE_DIR}/docker-compose/http-mesh-server.yaml down --remove-orphans
fi
