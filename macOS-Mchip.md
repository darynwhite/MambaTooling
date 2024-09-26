# Moving to an Apple ARM system
Getting an Apple M* chipped system up and working for PERL or other non-Python libraries

## Conda & the Python libraries
All of the YAML files in `./envs` are working to build a macOS ARM system that is ready for general data analytics and Python development. Also, the `condaFromScratch.sh` script has been modified to function for the `osx-arm64` build of Mambaforge (https://github.com/conda-forge/miniforge).

## Supporting Perl and other libraries not built for `osx-arm64`
We're going to lean on Rosetta 2 and BioConda to make this happen. It'll require a little extra work, by hand, but overall it does function.

The protocol:
- Check for Rosetta 2:
    - `pgrep oahd` (a number means it's installed and working)
        - if nothing, you'll need to get Xcode up to date and have Rosetta installed (may require CNSD)
            - https://support.apple.com/en-us/HT211861
- Create a new Conda environment (we don't want the base environment to use Rosetta 2): ***`mamba` is interchangeable with `conda`!!***
    - `mamba create -n perl; mamba activate perl`
    - `conda config --env --set subdir osx-64` ***this can only be done via CLI***
    - `mamba install perl-dbd-mysql`

This will install perl and various dependencies and will build using Rosetta 2 to operate on the ARM chip.

# Additional things for CLI applications

## Installing Homebrew for other functional CLI (mostly for `mysql`)
- Install Homebrew, ***without requiring sudo access***
    - Run `git clone https://github.com/Homebrew/brew brew`
        - You ***will*** need to add a symbolic link from `/opt/homebrew` to `~/brew` to make Homebrew happy
    - Double check your environment paths (`.zshrc`)
    - Relaunch your shell `exec zsh -l`
- Install the CLIs needed (the following are only suggestions):
    - `brew install gh`
    - `gh` is GitHub CLI, for general GitHub things
    - `git-lfs` is Git Large File Storage, useful when dealing with repos that have PDFs or other large binary data files
    - `shellcheck` is useful for linting various shell scripts

### Install Perl & CPAN-minus via Homebrew
This is another option, but when running Homebrew outside of their preferred location in `/opt/homebrew` we have seen issues with Perl dependencies

- Use Homebrew to install `perl`:
    - `brew install perl cpanminus`
- Then use CPAN to install DBD::mysql, but there's some dependencies you have to handle:
    - `cpanm DBD::mysql` This will handle all the dependencies and installation process. Stores failures as well.

That will install everything and make it available if you have the `/opt/homebrew/bin` directory in your path. I recommend putting it in your `.zshenv` file.
