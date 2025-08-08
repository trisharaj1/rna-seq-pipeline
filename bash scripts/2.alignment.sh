#!/bin/bash

GENOME_INDEX_PATH=./GenomeIndex/genome.fa
INPUT_FASTQ_DIR=./Preprocessed_FASTQ
OUTPUT_DIR=./Aligned_Results

mkdir -p $OUTPUT_DIR

for R1_FILE in $INPUT_FASTQ_DIR/*_1_subsampled_trimmed.fastq; do
    base_name=$(basename $R1_FILE _1_subsampled_trimmed.fastq)
    R2_FILE=$INPUT_FASTQ_DIR/${base_name}_2_subsampled_trimmed.fastq

    if [[ -f $R1_FILE && -f $R2_FILE ]]; then
        echo "Aligning $base_name..."
        bwa mem -t 4 $GENOME_INDEX_PATH $R1_FILE $R2_FILE > $OUTPUT_DIR/${base_name}.sam
        samtools view -bS $OUTPUT_DIR/${base_name}.sam > $OUTPUT_DIR/${base_name}.bam
        samtools sort -o $OUTPUT_DIR/${base_name}_sorted.bam $OUTPUT_DIR/${base_name}.bam
        samtools index $OUTPUT_DIR/${base_name}_sorted.bam
        rm $OUTPUT_DIR/${base_name}.sam
    else
        echo "Missing pair for $base_name, skipping..."
    fi
done

