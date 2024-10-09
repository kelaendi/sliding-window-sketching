#!/bin/bash

# Create dataset folder (and throw no exception of already exists)
mkdir -p dataset

# Generate SYNTHETIC data
python generate_synthetic.py    

# Download BIBD data if not already there
if [ ! -f ./dataset/bibd_22_8.mat ]; then
    echo "Downloading BIBD data..."
    wget https://www.cise.ufl.edu/research/sparse/mat/JGD_BIBD/bibd_22_8.mat --directory-prefix ./dataset
else
    echo "BIBD data already exists. Skipping download."
fi

# Download RAIL data if not already there
if [ ! -f ./dataset/rail2586.mat ]; then
    echo "Downloading RAIL data..."
    wget https://www.cise.ufl.edu/research/sparse/mat/Mittelmann/rail2586.mat --directory-prefix ./dataset
else
    echo "RAIL data already exists. Skipping download."
fi

# Download PAMAP2 data if not already there
if [ ! -d ./dataset/PAMAP2_Dataset ]; then
    if [ ! -f ./dataset/PAMAP2_Dataset.zip ]; then
        echo "Downloading PAMAP2 data..."
        wget https://archive.ics.uci.edu/static/public/231/pamap2+physical+activity+monitoring.zip -O dataset/PAMAP2_Dataset.zip
    fi
    echo "Unzipping PAMAP 2 data..."
    unzip dataset/PAMAP2_Dataset.zip -d dataset
    unzip dataset/PAMAP2_Dataset.zip -d dataset
    # unzip twice
else
    echo "PAMAP2 data already exists. Skipping download."
fi

# Download YEAR data if not already there
if [ ! -f ./dataset/yearpredictionmsd.txt ]; then
    if [ ! -f ./dataset/yearpredictionmsd.zip ]; then
        echo "Downloading YEAR data..."
        wget https://archive.ics.uci.edu/static/public/203/yearpredictionmsd.zip --directory-prefix ./dataset
    fi
    echo "Unzipping YEAR data..."
    unzip dataset/yearpredictionmsd.zip -d dataset
else
    echo "YEAR data already exists. Skipping download."
fi
