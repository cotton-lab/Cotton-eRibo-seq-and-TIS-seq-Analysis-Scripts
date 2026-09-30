#!/bin/bash

#SBATCH -J TisUTR
#SBATCH -p dell01
#SBATCH -N 1
#SBATCH -t 700:00:00
#SBATCH --cpus-per-task=8

#prepare_transcripts -g /beegfs/zhulab/wangm/annotation/AA-update.gtf -f /beegfs/zhulab/wangm/Genome/Gossypium_arboreum/genome.fa -o AA_RiboCode_annot

cd /beegfs/zhulab/wangm/work/ORF/Output/Tis-STAR-UTR
#ribotish quality -b ../Tis_AA0_1Aligned.sortedByCoord.out.bam -g /beegfs/zhulab/wangm/annotation/AA-update.gtf -t
#ribotish quality -b ../Tis_AA5_1Aligned.sortedByCoord.out.bam -g /beegfs/zhulab/wangm/annotation/AA-update.gtf -t
#ribotish quality -b ../Tis_AA10_1FAligned.sortedByCoord.out.bam -g /beegfs/zhulab/wangm/annotation/AA-update.gtf -t
#ribotish quality -b ../Tis_AA10_1NOAligned.sortedByCoord.out.bam -g /beegfs/zhulab/wangm/annotation/AA-update.gtf -t
#ribotish quality -b ../Tis_AA20_1Aligned.sortedByCoord.out.bam -g /beegfs/zhulab/wangm/annotation/AA-update.gtf -t
#ribotish quality -b ../merge0Aligned.sortedByCoord.out.bam -g /beegfs/zhulab/wangm/annotation/AA-update.gtf -t
#ribotish quality -b Tis-AA0Aligned.sortedByCoord.out.bam -g /beegfs/zhulab/wangm/annotation/AA-update.gtf -t
ribotish predict -t Tis-AA0Aligned.sortedByCoord.out.bam -g /beegfs/zhulab/wangm/annotation/AA-UTR-update.gtf -f /beegfs/zhulab/wangm/Genome/Gossypium_arboreum/genome.fa -o AA0utr_Ribotish_pred.new.txt --alt -p 8 --seq --aaseq --inframecount --longest
