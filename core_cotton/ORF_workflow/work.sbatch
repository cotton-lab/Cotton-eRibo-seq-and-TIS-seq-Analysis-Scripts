#!/bin/bash

#SBATCH -J RunJob
#SBATCH -p dell01
#SBATCH -N 1
#SBATCH -t 700:00:00
#SBATCH --cpus-per-task=8

#cd /beegfs/zhulab/wangm/work/ORF/
#prepare_transcripts -g /beegfs/zhulab/wangm/annotation/AA-UTR-update.gtf -f /beegfs/zhulab/wangm/Genome/Gossypium_arboreum/genome.fa -o AAutr_RiboCode_annot

path=/beegfs/zhulab/wangm/work/Ribo-seq/AA
for i in {'AA-0','AA-5','AA-10','AA-20'};do
for rep in {1,2};do
cd /beegfs/zhulab/wangm/work/ORF/Output/STAR-UTR
#cutadapt -m 24 -M 35 --trim-n --match-read-wildcards -e 0.2 --nextseq-trim 20 -a AGATCGGAAGAG -j 8 -o ${i}_rep${rep}_trim.fq.gz ${path}/${i}/rep${rep}_1.fq.gz
#bowtie -x /beegfs/zhulab/wangm/Genome/Rfam/index/cotton_ncRNA -p 8 -S --un ${i}_rep${rep}_rmncRNA.fq ${i}_rep${rep}_trim.fq.gz > test.sam
STAR --outFilterType BySJout --runThreadN 8 --outSAMattributes All --outFilterMismatchNmax 2 --genomeDir /beegfs/zhulab/wangm/Genome/Gossypium_arboreum/STAR_UTR_index/ --readFilesIn ../STAR/${i}_rep${rep}_rmncRNA.fq --outFileNamePrefix ${i}_rep${rep} --outSAMtype BAM SortedByCoordinate --quantMode TranscriptomeSAM GeneCounts --outFilterMultimapNmax 4 --outFilterMatchNmin 16 --alignEndsType EndToEnd
samtools index ${i}_rep${rep}Aligned.sortedByCoord.out.bam
done
done





