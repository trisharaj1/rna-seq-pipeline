#!/bin/bash

# Create output directories
mkdir -p ./trimmed_data
mkdir -p ./fastp_reports

# Run fastp for trimming and quality filtering
fastp \
  -i ../GSM461177_1.fastq \
  -I ../GSM461177_2.fastq \
  -o ./trimmed_data/trimmed_1.fastq \
  -O ./trimmed_data/trimmed_2.fastq \
  -h ./fastp_reports/fastp.html \
  -j ./fastp_reports/fastp.json

echo "✅ Trimming complete. Files saved to trimmed_data/ and reports saved to fastp_reports/*"


