#!/bin/bash

#SBATCH -J tis
#SBATCH -p cpu
#SBATCH -N 1
#SBATCH -t 700:00:00
#SBATCH --cpus-per-task=8

#prepare_transcripts -g /beegfs/zhulab/wangm/annotation/AA-update.gtf -f /beegfs/zhulab/wangm/Genome/Gossypium_arboreum/genome.fa -o AA_RiboCode_annot

cd /beegfs/zhulab/wangm/work/ORF/Output/Tis-STAR/Ribotish
#ribotish quality -b ../Tis_AA0_1Aligned.sortedByCoord.out.bam -g /beegfs/zhulab/wangm/annotation/AA-update.gtf -t
#ribotish quality -b ../Tis_AA5_1Aligned.sortedByCoord.out.bam -g /beegfs/zhulab/wangm/annotation/AA-update.gtf -t
#ribotish quality -b ../Tis_AA10_1FAligned.sortedByCoord.out.bam -g /beegfs/zhulab/wangm/annotation/AA-update.gtf -t
#ribotish quality -b ../Tis_AA10_1NOAligned.sortedByCoord.out.bam -g /beegfs/zhulab/wangm/annotation/AA-update.gtf -t
#ribotish quality -b ../Tis_AA20_1Aligned.sortedByCoord.out.bam -g /beegfs/zhulab/wangm/annotation/AA-update.gtf -t
#ribotish quality -b ../merge0Aligned.sortedByCoord.out.bam -g /beegfs/zhulab/wangm/annotation/AA-update.gtf -t
#ribotish predict -p 8 -t ../Tis_AA0_1Aligned.sortedByCoord.out.bam -b /beegfs/zhulab/wangm/work/ORF/Output/STAR/AA-0_rep1Aligned.sortedByCoord.out.bam -g /beegfs/zhulab/wangm/annotation/AA-update.gtf -f /beegfs/zhulab/wangm/Genome/Gossypium_arboreum/genome.fa -o AA0_Ribotish_pred.txt --alt --harr --longest
ribotish predict -p 8 -t ../Tis_AA5_1Aligned.sortedByCoord.out.bam -b /beegfs/zhulab/wangm/work/ORF/Output/STAR/AA-5_rep1Aligned.sortedByCoord.out.bam -g /beegfs/zhulab/wangm/annotation/AA-update.gtf -f /beegfs/zhulab/wangm/Genome/Gossypium_arboreum/genome.fa -o AA5_Ribotish_pred.txt --alt --harr --longest
