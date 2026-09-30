#!/bin/bash

#SBATCH -J TisRibocode
#SBATCH -p cpu
#SBATCH -N 1
#SBATCH -t 700:00:00
#SBATCH --cpus-per-task=4

cd /beegfs/zhulab/wangm/work/ORF/Output/Tis-STAR-UTR/RiboCode
metaplots -a /beegfs/zhulab/wangm/work/ORF/AAutr_RiboCode_annot -r ../Tis-AA0Aligned.toTranscriptome.out.bam
RiboCode -a /beegfs/zhulab/wangm/work/ORF/AAutr_RiboCode_annot -c metaplots_pre_config.txt -l no -g -o Tis_RiboCode_ORFs_result -A AAG,ACG,AGG,ATA,ATC,ATT,CTG,GTG,TTG
#for i in {'AA-0','AA-5','AA-10','AA-20'};do
#ORFcount -g RiboCode_ORFs_result_collapsed.gtf -r ../${i}_rep1Aligned.sortedByCoord.out.bam -f 15 -l 5 -e 100 -m 26 -M 34 -o ${i}_ORF1.counts
#ORFcount -g RiboCode_ORFs_result_collapsed.gtf -r ../${i}_rep2Aligned.sortedByCoord.out.bam -f 15 -l 5 -e 100 -m 26 -M 34 -o ${i}_ORF2.counts
#done


