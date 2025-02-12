#!/bin/bash/

conda env create -f acct3210.yaml
conda run -n acct3210 python -m ipykernel install --user --name acct3210
conda run -n acct3210 jupyter contrib nbextension install --user
