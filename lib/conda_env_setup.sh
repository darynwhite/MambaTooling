#!/bin/bash
[ -z "$1" ] && {
    echo 'Missing the environment directory!'
    exit 1
}
DIR="$(dirname "${BASH_SOURCE[0]}")"
# shellcheck source=/dev/null
source "$DIR"/setup.sh

## Setup environments from given directory of YAML files
for e in "$1"/*.yml; do
    name=$(basename "$e" .yml)
    echo "$name"
    mamba env create -f "$e"
done
Submarine
