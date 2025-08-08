# RNA-seq Workflow on Drosophila

This is my RNA-seq analysis pipeline for *Drosophila melanogaster*.  
It goes from raw reads → QC/trimming → genome index → alignment → counting reads per gene with featureCounts.

i didn’t upload the large fastq/bam files to github because they’re too big.  
if you want to run this yourself, you can download the same data i used from the links below. :)  

This dataset contained approximately 500 million base pairs of sequence data, with an 81.7% alignment rate to the annotated drosophila melanogaster genome.  

## Data I used

**Paired-end FASTQ files (subsampled)**
- Read 1: https://ftp.sra.ebi.ac.uk/vol1/fastq/SRR070/SRR070412/SRR070412_1.fastq.gz  
- Read 2: https://ftp.sra.ebi.ac.uk/vol1/fastq/SRR070/SRR070412/SRR070412_2.fastq.gz  

**Reference genome (Ensembl Release 113, BDGP6.46)**  
- Genome FASTA: https://ftp.ensembl.org/pub/release-113/fasta/drosophila_melanogaster/dna/Drosophila_melanogaster.BDGP6.46.dna.toplevel.fa.gz  
- GTF annotation: https://ftp.ensembl.org/pub/release-113/gtf/drosophila_melanogaster/Drosophila_melanogaster.BDGP6.46.113.gtf.gz  

---

## Tools I used
- `fastqc` – for quality check  
- `fastp` – for trimming  
- `bwa` – for alignment  
- `samtools` – for sorting and indexing BAM files  
- `featureCounts` (from subread) – for counting reads per gene  

---

## How I ran it (short version)
1. **QC + trimming** – fastqc + fastp  
2. **Genome index** – built with `bwa index genome.fa`  
3. **Alignment** – `bwa mem` with paired reads  
4. **Sort + index** – `samtools sort` and `samtools index`  
5. **Counting** – `featureCounts -T 4 -p -B -C ...`

---

## Output
- `Results/counts/featurecounts.txt` – counts per gene  
- `Results/counts/featurecounts.txt.summary` – mapping/counting summary  

