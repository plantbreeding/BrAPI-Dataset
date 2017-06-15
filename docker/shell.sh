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

CONTAINER_NAME="${PROJECT_NAME}_${SERVICE_NAME}"

# Search
CONTAINER_ID=$(docker ps | grep $CONTAINER_NAME | cut -f1 -d$' ')
[ -z "$CONTAINER_ID" ] && fail "No container $CONTAINER_NAME running. Exiting."


# Launch bash
( eval_verbose docker exec -it $CONTAINER_ID bash ) ||
# Fallback on classic shell
( echo "Fallback to classic shell..."; eval_verbose docker exec -it $CONTAINER_ID sh )
