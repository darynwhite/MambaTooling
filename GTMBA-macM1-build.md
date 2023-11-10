# Moving to an Apple ARM system for GTMBA processes
Getting an Apple M chipped system up and working for GTMBA data analytics

## Conda & the Python libraries
All of the YAML files in `./envs` are working to build an M1 system that is ready for the GTMBA Python Library. Also, the `condaFromScratch.sh` script has been modified to function for the M1 build of Mambaforge (https://github.com/conda-forge/miniforge).

## Supporting Atlas processing library (Perl)
We're going to lean on Rosetta 2 and BioConda to make this happen. It'll require a little extra work, by hand, but overall it does function.

The protocol:
- Check for Rosetta 2:
    - `pgrep oahd` (a number means it's installed and working)
    - if nothing, you'll need to get Xcode up to date and have Rosetta installed (may require CNSD)
        - https://support.apple.com/en-us/HT211861
- Create a new Conda environment (we don't want the base environment to use Rosetta 2): ***`mamba` is interchangeable with `conda`!!***
    - `mamba create -n atlasProc; mamba activate atlasProc`
    - `mamba config --env --append channels bioconda`
    - `mamba config --env --set subdir osx-64` ***this can only be done via CLI***
    - `mamba install perl-dbd-mysql`

That protocol should install everything required for Atlas Processing inside your chosen Conda Environment. I do suggest activating the `work` environment and then activating the `atlasProc` environment, this will add the Python dependencies under the Perl dependencies, or it has worked for my needs so far.

# Additional things for CLI applications

## Installing Homebrew for other functional CLI (mostly for `mysql`)
- Install Homebrew, ***without requiring sudo access***
    - Run `git clone https://github.com/Homebrew/brew brew`
        - You ***will*** need CNSD to add a symbolic link from `/opt/homebrew` to `~/brew` to make Homebrew happy
    - Double check your environment paths (`.zshrc`)
    - Relaunch your shell `exec zsh -l`
- Install the CLIs needed (the following are only suggestions):
    - `brew install gh mysql gnupg`
    - `gh` is GitHub CLI, for general GitHub things
    - `gnupg` is GNUpg and dependencies, allows for signing of git commits and other things
    - `mysql` is called for in a few scripts for GTMBA data processing, solely to connect to our MariaDB database at PMEL

### Install Perl & CPAN-minus via Homebrew
This is another option, but when running Homebrew outside of their preferred location in `/opt/homebrew` we have seen issues with Perl dependencies

- Use Homebrew to install `perl`:
    - `brew install perl cpanminus`
- Then use CPAN to install DBD::mysql, but there's some dependencies you have to handle:
    - `cpanm DBD::mysql` This will handle all the dependencies and installation process. Stores failures as well.

That will install everything and make it available if you have the `/opt/homebrew/bin` directory in your path. I recommend putting it in your `.zshenv` file.
