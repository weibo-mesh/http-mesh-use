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

s() {
	while getopts "xs" OPTS; do
		case "${OPTS}" in
		x)
			fg
			;;
		s)
			python3 -m http.server --directory "${BASE_DIR}/html/" &
			;;
		\?)
			echo "
k8 is a tool for K8S.

proxy="http://10.211.55.5:8080"
export ALL_PROXY=${proxy}
export HTTP_PROXY=${proxy}
export HTTPS_PROXY=${proxy}
export all_proxy=${proxy}
export http_proxy=${proxy}
export https_proxy=${proxy}

 $ALL_PROXY $HTTP_PROXY $HTTPS_PROXY $all_proxy $http_proxy $https_proxy
Usage:

	k8 options [arguments]

The options are:

	-u       start the php-fpm and openresty service.
	         php-fpm run path is ${RUN_PATH}/fpm.d
			 php ini path is ${RUN_PATH}/fpm.d/etc
			 openresty run path is ${RUN_PATH}/ngx.d
	-d       down both openresty and php-fpm service.
		"
			;;
		esac
	done
}
