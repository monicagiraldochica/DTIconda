#!/bin/bash
module load miniforge
conda create -c https://fsl.fmrib.ox.ac.uk/fsldownloads/fslconda/public/ -c conda-forge -n DTIconda
conda activate DTIconda
conda config --set channel_priority disabled
conda install anaconda::libgcc

# Install FSL
wget https://fsl.fmrib.ox.ac.uk/fsldownloads/fslconda/releases/fsl-6.0.7_linux-64.yml
f=$(python3 readFSLyml.py)
for line in $f
do
	IFS='=' read -a array <<< $line
	n=$(conda list -f ${array[0]} | tail -n +4 | wc -l)
	[ $n -gt 0 ] && continue
	echo "Installing ${array[0]} version ${array[1]}..."
	conda install $line -y &> /dev/null
	n=$(conda list -f ${array[0]} | tail -n +4 | wc -l)
	[ $n -gt 0 ] && "DONE" && continue

	echo "Installing ${array[0]} (no specified version)..."
	conda install ${array[0]} -y &> /dev/null
	[ $n -gt 0 ] && echo "DONE" || echo "NOT installed"
done
