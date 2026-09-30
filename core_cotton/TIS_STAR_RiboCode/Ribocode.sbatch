#!/bin/bash

#SBATCH -J RunJob
#SBATCH -p dell01
#SBATCH -N 1
#SBATCH -t 700:00:00
#SBATCH --cpus-per-task=8

cd /beegfs/zhulab/wangm/work/ORF/Output/Tis-STAR/Ribocode
metaplots -a /beegfs/zhulab/wangm/work/ORF/AA_RiboCode_annot -i bamlist
RiboCode -a /beegfs/zhulab/wangm/work/ORF/AA_RiboCode_annot -c metaplots_pre_config.txt -l no -g -o RiboCode_ORFs_result
#for i in {'AA0','AA5','AA20'};do
#ORFcount -g RiboCode_ORFs_result_collapsed.gtf -r ../${i}_rep1Aligned.sortedByCoord.out.bam -f 15 -l 5 -e 100 -m 26 -M 34 -o ${i}_ORF1.counts
#ORFcount -g RiboCode_ORFs_result_collapsed.gtf -r ../${i}_rep2Aligned.sortedByCoord.out.bam -f 15 -l 5 -e 100 -m 26 -M 34 -o ${i}_ORF2.counts
#done


