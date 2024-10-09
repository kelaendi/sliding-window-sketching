#!/bin/bash

# Create dataset folder (and throw no exception of already exists)
mkdir -p dataset

# Generate SYNTHETIC data
python generate_synthetic.py    

# Download BIBD data
wget https://www.cise.ufl.edu/research/sparse/mat/JGD_BIBD/bibd_22_8.mat --directory-prefix ./dataset 

# Download PAMAP2 data
wget https://archive.ics.uci.edu/static/public/231/pamap2+physical+activity+monitoring.zip -O dataset/PAMAP2_Dataset.zip
unzip dataset/PAMAP2_Dataset.zip -d dataset

# Download RAIL data
wget https://www.cise.ufl.edu/research/sparse/mat/Mittelmann/rail2586.mat --directory-prefix ./dataset 

# Download YEAR data
wget https://archive.ics.uci.edu/static/public/203/yearpredictionmsd.zip --directory-prefix ./dataset 
unzip dataset/yearpredictionmsd.zip -d dataset
