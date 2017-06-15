#!/bin/bash
set -x
DIR="$(cd "$(dirname "$(readlink -f "${BASH_SOURCE[0]}")" )" && pwd)"

source $DIR/env.sh

check_file \$COMPOSE_FILE $COMPOSE_FILE

# Build & run containers
eval_verbose docker-compose -f $COMPOSE_FILE -p $PROJECT_NAME up
