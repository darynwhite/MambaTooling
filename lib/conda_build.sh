#!/bin/bash
DIR="$(dirname "${BASH_SOURCE[0]}")"

source "$DIR"/setup.sh
## Swqap comments for using MiniConda over MiniForge/Mamba
# conda=Miniconda3-latest-MacOSX-arm64.sh
# curl -O "https://repo.anaconda.com/miniconda/${conda}"
curl -fsSLo Miniforge3.sh "https://github.com/conda-forge/miniforge/releases/latest/download/Miniforge3-MacOSX-$(uname -m).sh"
bash Miniforge3.sh -b -p "${HOME}"/conda
SetFile -a V "${HOME}"/conda
