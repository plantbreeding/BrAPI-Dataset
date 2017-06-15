#!/bin/bash
set -x
DIR="$(cd "$(dirname "$(readlink -f "${BASH_SOURCE[0]}")" )" && pwd)"

source $DIR/env.sh

CONTAINERS=$(docker ps -a | grep $PROJECT_NAME | cut -f1 -d$' ')
[ -n "$CONTAINERS" ] && {
  eval_verbose docker stop $CONTAINERS
  eval_verbose docker rm $CONTAINERS
}

IMAGES=$(docker images | grep $PROJECT_NAME | tr -s ' ' | cut -f3 -d$' ' )
[ -n "$IMAGES" ] && eval_verbose docker rmi $IMAGES
