#!/bin/bash

#SBATCH -J Ribotish
#SBATCH -p dell01
#SBATCH -N 1
#SBATCH -t 700:00:00
#SBATCH --cpus-per-task=4

#prepare_transcripts -g /beegfs/zhulab/wangm/annotation/AA-update.gtf -f /beegfs/zhulab/wangm/Genome/Gossypium_arboreum/genome.fa -o AA_RiboCode_annot

cd /beegfs/zhulab/wangm/work/ORF/Output/STAR/Ribotish
ribotish predict -b ../AA-0_rep1Aligned.sortedByCoord.out.bam,../AA-0_rep2Aligned.sortedByCoord.out.bam,../AA-5_rep1Aligned.sortedByCoord.out.bam,../AA-5_rep2Aligned.sortedByCoord.out.bam,../AA-10_rep1Aligned.sortedByCoord.out.bam,../AA-10_rep2Aligned.sortedByCoord.out.bam,../AA-20_rep1Aligned.sortedByCoord.out.bam,../AA-20_rep2Aligned.sortedByCoord.out.bam -g /beegfs/zhulab/wangm/annotation/AA-update.gtf -f /beegfs/zhulab/wangm/Genome/Gossypium_arboreum/genome.fa --longest -o Ribotish_pred.txt


