#!/bin/bash
DIR="$(dirname "${BASH_SOURCE[0]}")"

envInstall="$DIR"/lib/conda_env_setup.sh
envs="$DIR"/envs/

source "$DIR"/lib/conda_build.sh
mamba init zsh
# mamba update --all -y
mamba update -y conda
# shellcheck source=./lib/conda_env_setup.sh
source "${envInstall}" "${envs}"
