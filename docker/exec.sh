#!/bin/bash
DIR="$(cd "$(dirname "$(readlink -f "${BASH_SOURCE[0]}")" )" && pwd)"

source $DIR/env.sh

usage() {
  fail <<EOF
$1

Usage: $me <service name> <command> [<docker exec options>...]
EOF
}
SERVICE_NAME=$1
shift
[ -z "$SERVICE_NAME" ] && {
  usage "Please choose a service container to attach to (ex: posgtres)."
}
COMMAND=$1
shift
[ -z "$COMMAND" ] && {
  usage "Please specify the command you want to execute in the container."
}
OPTS=$@

CONTAINER_NAME="${PROJECT_NAME}_${SERVICE_NAME}"

# Search
CONTAINER_ID=$(docker ps | grep $CONTAINER_NAME | cut -f1 -d$' ')
[ -z "$CONTAINER_ID" ] && fail "No container $CONTAINER_NAME running. Exiting."

# Launch command
eval_verbose "docker exec $OPTS -it $CONTAINER_ID $COMMAND"
