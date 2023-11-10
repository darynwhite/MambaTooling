# Desktop setup of Conda environment
## Using this package to install Mambaforge in a bash terminal
#### Fresh install via script only
```
bash condaFromScratch.sh
```
This script will download Mambaforge and install it, then create and populate environments based on the YAML files found in `./envs`.

This will leave the base environment untouched and keep most of the working libraries in environments. Of these, `work` is the most utilized.

#### Using the config example file as .condarc config file
```
cp configBase ~/.condarc
```

## Some Conda Resources
#### Conda documentation
https://docs.conda.io/projects/conda/en/latest/user-guide/index.html

#### Miniforge / Mambaforge source and repo
https://github.com/conda-forge/miniforge

#### Python 3 (64-bit) Miniconda installer
https://repo.continuum.io/miniconda/Miniconda3-latest-MacOSX-x86_64.sh

#### All installers and packages
https://repo.continuum.io/

#### Package search
https://anaconda.org/ or https://conda-forge.org/feedstock-outputs/

## Conda basics
#### System update options
```
mamba update mamba conda
mamba update --all -y
mamba update -n {env} --all -y
```
Adding the `-y` to any of the above update commands to have the updater run without waiting for input

#### Config flags to set
```
conda config --set auto_update_conda False
conda config --set auto_activate_base False
```
Disabling `auto_activate_base` prevents conda from activating the base on every new terminal window

#### Final suggestion
If you don't run `mamba init` in the shell you plan to use, you will want to add `${HOME}/conda/bin` to your `PATH` variable in your `.*rc` file.
