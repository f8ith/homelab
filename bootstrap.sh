#!/usr/bin/env sh
set -eu

IMAGE="ghcr.io/kimdre/doco-cd:0.125.1"
DATA_PATH="${DATADIR:?DATADIR is required}/doco-cd"
REPO_URL="https://github.com/f8ith/homelab.git"

POLL_CONFIG="
  - url: $REPO_URL
    reference: doco"

if [ -n "${DOCO_TARGET:-}" ]; then
  POLL_CONFIG="$POLL_CONFIG
    target: $DOCO_TARGET"
fi

docker run --rm \
  -v /var/run/docker.sock:/var/run/docker.sock \
  --mount "type=bind,src=${DATA_PATH},dst=/data" \
  -e SELF_UPDATE_ENABLED=true \
  -e GIT_ACCESS_TOKEN="${GIT_ACCESS_TOKEN:-}" \
  -e POLL_CONFIG="$POLL_CONFIG" \
  "$IMAGE" apply-self --bootstrap
