#!/bin/bash
#
# boot.sh
# Applies docker-compose environment variables to applications on container start
#

set -e

echo "Starting config in ${APP_ENV:-$DEFAULT_APP_ENV} mode ..."

export APP_HOSTNAME=${APP_HOSTNAME:-$(hostname -f)}

echo " * host:   ${APP_HOSTNAME}"


# =============================================================================
# 	BOOT
# =============================================================================

echo -e "\nDone\n$(date)\n"

if [[ "$1" = "/sbin/my_init" ]] ; then
	exec /sbin/my_init 
else
	echo "$ /bin/sh -c $1"
	exec /bin/sh -c $1
fi
