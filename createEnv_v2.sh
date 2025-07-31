#!/bin/bash
module load miniforge

# Install FSL
#wget https://fsl.fmrib.ox.ac.uk/fsldownloads/fslconda/releases/fsl-6.0.7_linux-64.yml
# Edited the yml file to change the name of the env since it will have other software too
#conda env create -f fsl-6.0.7_linux-64_edited.yml

# Check FSL installation
conda activate DTIconda

#rm -f installed.txt NOTinstalled.txt
#f=$(python3 readFSLyml.py)
#for line in $f
#do
#	IFS='=' read -a array <<< $line
#	n=$(conda list -f ${array[0]} | tail -n +4 | wc -l)
#	if [ $n -gt 0 ]
#	then
#                echo "${array[0]} installed"
#                echo $line >> installed.txt
#        else
#		echo "${array[0]} NOT installed"
#		echo $line >> NOTinstalled.txt
#        fi
#done

# Install ANTS
#conda install conda-forge::ants

# Install dcmtk
conda install bioconda::dcmtk

# Install dcm2niix
#conda install conda-forge::dcm2niix

# Install Connectome Workbench
#conda install bioconda::connectome-workbench

# Install MRtrix3
#conda install mrtrix3::mrtrix3
