#!/bin/bash
DIR="$(cd "$(dirname "$(readlink -f "${BASH_SOURCE[0]}")" )" && pwd)"

fail() {
  echo "${@:-$(cat)}" >&2
  exit 1
}

eval_verbose() {
  echo "[CMD LAUNCH] $@"
  eval "$@" || fail "[CMD FAIL] $@"
}

export COMPOSE_FILE=$DIR/docker-compose.yml
export PROJECT_NAME=brapidataset
