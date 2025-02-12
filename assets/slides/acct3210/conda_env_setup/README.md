# setting up a `conda env` for the course

1. [Install Homebrew](https://brew.sh/)
2. Install miniconda: `brew install miniconda`

## Now we can set up a conda environment

- `conda create --name acct3210_311 python=3.11 anaconda notebook=6`

  - this is what I am using because I want notebook 6 for the slides
  - this is an alternative: `conda create --name acct3210_312 python=3.12 anaconda`

- `conda activate acct3210_311`
- `pip install gekko`
- `softwareupdate --install-rosetta` gekko requires this!
- `jupyter contrib nbextension install --user`
