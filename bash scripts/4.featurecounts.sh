#!/bin/bash

# Activate your conda environment with featureCounts installed
#sudo apt install subread

# Paths to the input BAM files, annotation file, and output directory
BAM_DIR=./Aligned_Results
ANNOTATION_FILE=./ReferenceData/genes.gtf
OUTPUT_DIR=./Results/Counts

# Create output directory if it does not exist
mkdir -p $OUTPUT_DIR

# Run featureCounts for paired-end reads
featureCounts -T 4 -s 2 -p -a $ANNOTATION_FILE -o $OUTPUT_DIR/FeatureCounts.txt $BAM_DIR/*_sorted.bam

# Process the FeatureCounts Matrix to keep only the columns needed in downstream analysis
cut -f1,7-12 $OUTPUT_DIR/FeatureCounts.txt > $OUTPUT_DIR/FeatureCounts_Mod.txt

# Additional processing to clean up the column names (optional)
# Example: Remove the first line, path, and _sorted.bam from the file to make simple column names
# You can edit the file manually using a text editor or further automate the process if needed

echo "Read counting complete. Results are in the Counts directory."
