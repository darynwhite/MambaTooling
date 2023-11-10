#!/bin/bash
DIR="$(dirname "${BASH_SOURCE[0]}")"

source $DIR/setup.sh
# conda=Miniconda3-latest-MacOSX-arm64.sh
conda=Mambaforge-MacOSX-arm64.sh
# curl -O "https://repo.anaconda.com/miniconda/${conda}"
curl -L -O "https://github.com/conda-forge/miniforge/releases/latest/download/${conda}"
bash ${conda} -b -p ${HOME}/conda
SetFile -a V ${HOME}/conda
