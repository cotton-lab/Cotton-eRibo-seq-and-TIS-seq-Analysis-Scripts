#!/bin/bash

#SBATCH -J IndexTrim
#SBATCH -p dell01
#SBATCH -N 1
#SBATCH -t 700:00:00
#SBATCH --cpus-per-task=8

cd /beegfs/zhulab/wangm/work/ORF/Other_Spelices/cutadapt/
#cat /beegfs/zhulab/wangm/work/Ribo-seq/Arabidopsis_thaliana/*.fastq.gz > Ath_FastqMerge.fq.gz
#cat /beegfs/zhulab/wangm/work/Ribo-seq/Oryza_sativa/*.fastq.gz > Osa_FastqMerge.fq.gz
#cat /beegfs/zhulab/wangm/work/Ribo-seq/Solanum_lycopersicum/*.fastq.gz > Sly_FastqMerge.fq.gz
#cat /beegfs/zhulab/wangm/work/Ribo-seq/Zea_mays/*.fastq.gz > Zma_FastqMerge.fq.gz
#fastqc -t 8 -o ./ Ath_FastqMerge.fq.gz Osa_FastqMerge.fq.gz Sly_FastqMerge.fq.gz Zma_FastqMerge.fq.gz
cutadapt -m 24 -M 35  --match-read-wildcards --trim-n -e 0.2 --nextseq-trim 20 -n 4 -a AGATCGGAAGAG -a TGGAATTCTCGG -a GATCGTCGGACT -j 8 -o Ath_FastqMerge_trim.fq.gz Ath_FastqMerge.fq.gz
cutadapt -m 24 -M 35  --match-read-wildcards --trim-n -e 0.2 --nextseq-trim 20 -n 4 -a AGATCGGAAGAG -a TGGAATTCTCGG -a GATCGTCGGACT -j 8 -o Osa_FastqMerge_trim.fq.gz Osa_FastqMerge.fq.gz
cutadapt -m 24 -M 35  --match-read-wildcards --trim-n -e 0.2 --nextseq-trim 20 -n 4 -a AGATCGGAAGAG -a TGGAATTCTCGG -a GATCGTCGGACT -j 8 -o Sly_FastqMerge_trim.fq.gz Sly_FastqMerge.fq.gz
cutadapt -m 24 -M 35  --match-read-wildcards --trim-n -e 0.2 --nextseq-trim 20 -n 4 -a AGATCGGAAGAG -a TGGAATTCTCGG -a GATCGTCGGACT -j 8 -o Zma_FastqMerge_trim.fq.gz Zma_FastqMerge.fq.gz



