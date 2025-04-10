## Process for setting up python in a POSIX environment (MacOS, Linux, Windows subsystem for Linux)

1. Get a package manager (i.e. [brew.sh](brew.sh))

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

2. Install `miniconda` to manage your python environments.

```bash
brew install miniconda 
```

3. Use `conda` to install a python environment that holds the anaconda stack:

```bash 
conda create --name acct3210 python=3.11 anaconda 
```

4. activate that environment and launch ipython 

```bash
conda activate acct3210 
ipython 
```

## Other systems:

The steps above will work exactly for MacOS users. Below are examples for Linux and Windows systems. While the MAcOS solution is well tested, the following solutions will work but may not be optimal.


### Linux users can `wget` `miniconda` directly from anaconda:

```bash
mkdir -p ~/miniconda3
wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O ~/miniconda3/miniconda.sh
bash ~/miniconda3/miniconda.sh -b -u -p ~/miniconda3
rm -rf ~/miniconda3/miniconda.sh
~/miniconda3/bin/conda init bash
~/miniconda3/bin/conda init zsh
```

Then follow steps 3 & 4. 

### Windows:

First, install [Windows subsystem for Linux](https://learn.microsoft.com/en-us/windows/wsl/install) and then use the Linux approach.
