#!/bin/bash

#SBATCH -J Diff
#SBATCH -p dell01
#SBATCH -N 1
#SBATCH -t 700:00:00
#SBATCH --cpus-per-task=8

cd /beegfs/zhulab/wangm/work/ORF/Output/Tis-STAR/Ribotish/TisDiff
#ribotish tisdiff --ipth 0.05 --iqth 0.5 -1 ../AA0/AA0_Ribotish_pred.txt -2 ../AA5/AA5_Ribotish_pred.txt -a ../../Tis_AA0_1Aligned.sortedByCoord.out.bam -b ../../Tis_AA5_1Aligned.sortedByCoord.out.bam -g /beegfs/zhulab/wangm/annotation/AA-update.gtf -o test.txt 
ribotish tisdiff --ipth 0.05 --iqth 0.5 -1 ../AA0/AA0_Ribotish_pred.txt -2 ../AA20/AA20_Ribotish_pred.txt -a ../../Tis_AA0_1Aligned.sortedByCoord.out.bam -b ../../Tis_AA20_1Aligned.sortedByCoord.out.bam -g /beegfs/zhulab/wangm/annotation/AA-update.gtf -o AA0vs20_Diff.txt
#ribotish tisdiff --ipth 0.05 --iqth 0.5 -1 ../AA0/AA0_Ribotish_pred.txt -2 ../AA10/AA10F_Ribotish_pred.txt -a ../../Tis_AA0_1Aligned.sortedByCoord.out.bam -b ../../Tis_AA10_1FAligned.sortedByCoord.out.bam -g /beegfs/zhulab/wangm/annotation/AA-update.gtf -o AA0vs10_Diff.txt
#ribotish tisdiff --ipth 0.05 --iqth 0.5 -1 ../AA5/AA5_Ribotish_pred.txt -2 ../AA10/AA10F_Ribotish_pred.txt -a ../../Tis_AA5_1Aligned.sortedByCoord.out.bam -b ../../Tis_AA10_1FAligned.sortedByCoord.out.bam -g /beegfs/zhulab/wangm/annotation/AA-update.gtf -o AA5vs10_Diff.txt
#ribotish tisdiff --ipth 0.05 --iqth 0.5 -1 ../AA5/AA5_Ribotish_pred.txt -2 ../AA20/AA20_Ribotish_pred.txt -a ../../Tis_AA5_1Aligned.sortedByCoord.out.bam -b ../../Tis_AA20_1Aligned.sortedByCoord.out.bam -g /beegfs/zhulab/wangm/annotation/AA-update.gtf -o AA5vs20_Diff.txt
#ribotish tisdiff --ipth 0.05 --iqth 0.5 -1 ../AA10/AA10F_Ribotish_pred.txt -2 ../AA20/AA20_Ribotish_pred.txt -a ../../Tis_AA10_1FAligned.sortedByCoord.out.bam -b ../../Tis_AA20_1Aligned.sortedByCoord.out.bam -g /beegfs/zhulab/wangm/annotation/AA-update.gtf -o AA10vs20_Diff.txt










