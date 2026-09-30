#!/bin/bash

#SBATCH -J TisUTR
#SBATCH -p dell01
#SBATCH -N 1
#SBATCH -t 700:00:00
#SBATCH --cpus-per-task=8

#cd /beegfs/zhulab/wangm/work/ORF/
#prepare_transcripts -g /beegfs/zhulab/wangm/annotation/AA-UTR-update.gtf -f /beegfs/zhulab/wangm/Genome/Gossypium_arboreum/genome.fa -o AAutr_RiboCode_annot

cd /beegfs/zhulab/wangm/work/ORF/Output/Tis-STAR-UTR
#cutadapt -m 24 -M 35 --trim-n --match-read-wildcards -e 0.2 --nextseq-trim 20 -a AGATCGGAAGAG -j 8 -o ${i}_rep${rep}_trim.fq.gz ${path}/${i}/rep${rep}_1.fq.gz
#bowtie -x /beegfs/zhulab/wangm/Genome/Rfam/index/cotton_ncRNA -p 8 -S --un ${i}_rep${rep}_rmncRNA.fq ${i}_rep${rep}_trim.fq.gz > test.sam
STAR --outFilterType BySJout --runThreadN 8 --outSAMattributes All --outFilterMismatchNmax 2 --genomeDir /beegfs/zhulab/wangm/Genome/Gossypium_arboreum/STAR_UTR_index/ --readFilesIn un_align.fastq --outFileNamePrefix Tis-AA0 --outSAMtype BAM SortedByCoordinate --quantMode TranscriptomeSAM GeneCounts --outFilterMultimapNmax 4 --outFilterMatchNmin 16 --alignEndsType EndToEnd
samtools index Tis-AA0Aligned.sortedByCoord.out.bam






