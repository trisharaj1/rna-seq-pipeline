#!/bin/bash

#Install FastQC and Fastp installed
#sudo apt install fastqc
#sudo apt install fastp

# Create directories for output
mkdir -p FastQC_Results Preprocessed_FASTQ

# Loop through all FASTQ files in the input directory
for file in ./Input_FASTQ/*.fastq; do
    # Extract the file name without the path and extension
    filename=$(basename $file .fastq)
    
    # Run FastQC
    fastqc $file --outdir=FastQC_Results
    
    # Run Fastp
    fastp \
    -i $file \
    -o Preprocessed_FASTQ/${filename}_trimmed.fastq \
    -h Preprocessed_FASTQ/${filename}_fastp.html \
    -j Preprocessed_FASTQ/${filename}_fastp.json

done

echo "Preprocessing complete. Results are in FastQC_Results and Preprocessed_FASTQ directories."
