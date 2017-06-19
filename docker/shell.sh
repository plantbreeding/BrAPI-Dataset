#!/bin/bash
DIR="$(cd "$(dirname "$(readlink -f "${BASH_SOURCE[0]}")" )" && pwd)"

source $DIR/env.sh

SERVICE_NAME=$1
[ -z "$SERVICE_NAME" ] && {
  fail <<EOF
Please choose a service container to attach to (ex: maven, tomcat, etc.).

Usage: $me <service name>
EOF
}

# Launch bash
( $DIR/exec.sh $SERVICE_NAME bash ) ||
# Fallback on classic shell
( echo "Fallback to classic shell..."; $DIR/exec.sh $SERVICE_NAME sh )
