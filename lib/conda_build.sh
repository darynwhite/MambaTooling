#!/bin/bash
DIR="$(dirname "${BASH_SOURCE[0]}")"

source "$DIR"/lib/setup.sh
# conda=Miniconda3-latest-MacOSX-arm64.sh
# curl -O "https://repo.anaconda.com/miniconda/${conda}"
conda=Miniforge3-MacOSX-arm64.sh
curl -L -O "https://github.com/conda-forge/miniforge/releases/latest/download/${conda}"
bash ${conda} -b -p "${HOME}"/conda
SetFile -a V "${HOME}"/conda
