#!/bin/bash

# Activate your conda environment with BWA installed (if applicable)
#sudo apt install bwa

# Path to the reference genome FASTA file
REFERENCE_GENOME=./ReferenceData/genome.fa

# Directory to store the BWA genome index
GENOME_INDEX_DIR=./GenomeIndex

# Create the directory if it does not exist
mkdir -p $GENOME_INDEX_DIR

# Change to the genome index directory
cd $GENOME_INDEX_DIR

# Run BWA to generate the genome index
bwa index $REFERENCE_GENOME

echo "Genome indexing complete. The index files are stored in the GenomeIndex directory."
