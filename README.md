# Cotton eRibo-seq and TIS-seq Analysis Scripts

This repository contains candidate analysis scripts used for ribosome profiling
and translation initiation site sequencing in diploid cotton (*Gossypium
arboreum*), together with selected scripts for comparative plant datasets.
The scripts support read preprocessing, non-coding RNA filtering, genome
alignment, ORF/TIS prediction, ORF counting, TIS comparison and selected
Ribo-seq quality analyses.

The repository is intended to document the computational materials associated
with the manuscript **"A high-resolution translatome atlas unveils pervasive
non-canonical translation and stress-adaptive regulation in plants.”** It is a
collection of analysis scripts associated with the manuscript.

## Analysis overview

The candidate workflow is organized into the following stages:

1. Adapter trimming and read-length filtering with Cutadapt.
2. Removal of reads mapping to rRNA and other non-coding RNA references with
   Bowtie.
3. Alignment of retained reads to the cotton genome with STAR.
4. ORF prediction and counting from Ribo-seq data with RiboCode and RiboTish.
5. TIS-seq alignment, initiation-site/ORF prediction and differential TIS
   analysis.
6. Generation of selected coverage tracks with deepTools `bamCoverage`.
7. Metagene and periodicity analyses with RiboMiner.

The exact order and subset of scripts used for each manuscript figure must be
confirmed against the original analysis records before publication.

## Directory structure

```text
core_cotton/
  ORF_workflow/              Cotton Ribo-seq alignment workflow
  eRibo_STAR_RiboCode/       Cotton RiboCode ORF counting
  eRibo_STAR_RiboTish/       Cotton RiboTish ORF prediction
  TIS_STAR/                  Cotton TIS preprocessing/alignment examples
  TIS_STAR_RiboCode/         Cotton TIS RiboCode analysis
  TIS_STAR_RiboTish/         Cotton TIS RiboTish analysis
  TIS_STAR_UTR_alignment/    TIS alignment using UTR-updated references
  TIS_STAR_UTR_RiboCode/     UTR-aware TIS RiboCode analysis
  TIS_STAR_UTR_RiboTish/     UTR-aware TIS RiboTish analysis
  TIS_Diff/                  Differential TIS analysis

other_species/
  cutadapt/                  Comparative plant read preprocessing
  bowtie/                    Comparative plant filtering/alignment scripts
  TIS/                       Selected Arabidopsis and tomato TIS scripts

auxiliary/
  RiboMiner/                 Ribo-seq metagene analysis

additional_analysis_notebooks/
  part1_rRNA_analysis/       rRNA composition, depth and sequence divergence
  part2_multiORF_analysis/   multi-TIS and supporting-evidence analyses
```

## Additional downstream analyses

Six Jupyter notebooks are included under `additional_analysis_notebooks/`.
They cover rRNA composition/depth/divergence and downstream multi-TIS analyses,
including cross-species conservation and CAGE/PacBio support.

## Software and reference requirements

The scripts call some or all of the following programs:

- Cutadapt
- FastQC
- Bowtie 1
- STAR
- samtools
- RiboCode, including `metaplots` and `ORFcount`
- RiboTish
- deepTools, including `bamCoverage`
- RiboMiner

The original scripts refer to a cotton genome FASTA file, cotton gene
annotations, STAR indexes, Rfam/non-coding RNA indexes and RiboCode annotation
directories. The reference genome and annotation versions should match those
used for the manuscript.

## Usage notes

The scripts are written as SLURM batch scripts and contain cluster-specific
paths. Before execution, the user must verify and update:

- input FASTQ and BAM paths;
- genome FASTA and STAR index paths;
- rRNA/non-coding RNA Bowtie index paths;
- GTF annotation and RiboCode annotation paths;
- sample names and replicate mapping;
- read-length, adapter, P-site and TIS parameters;
- conda environment and software versions;
- SLURM partition, CPU and wall-time settings.

Do not submit these scripts directly to a cluster without checking the active
and commented commands. Several files contain alternative historical commands,
and some preprocessing steps are documented only as comments.

## Reproducibility status

The current package contains 18 `.sbatch` scripts and 6 additional Jupyter
notebooks. The scripts and notebooks are grouped by analysis role so that they
can be mapped to the corresponding manuscript methods and results.

Before public release, the authors or bioinformatics collaborators should
confirm the executed script versions, sample-to-file mapping, software versions,
reference genome and annotation versions, parameter values, and the exact
scripts supporting each reported figure and table.

## Data and credentials

Raw FASTQ files, BAM files, bigWig files, reference indexes, passwords, tokens
and other credentials are intentionally excluded. No credentials are required
to inspect the scripts in this repository.

## Project name

**Cotton eRibo-seq and TIS-seq Analysis Scripts**


