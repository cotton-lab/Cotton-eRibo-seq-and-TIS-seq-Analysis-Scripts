#!/bin/bash

#SBATCH -J Tis
#SBATCH -p fat
#SBATCH -N 1
#SBATCH -t 700:00:00
#SBATCH --cpus-per-task=4

#prepare_transcripts -g /beegfs/zhulab/wangm/annotation/AA-update.gtf -f /beegfs/zhulab/wangm/Genome/Gossypium_arboreum/genome.fa -o AA_RiboCode_annot

path=/beegfs/zhulab/wangm/work/Tis-seq
cd /beegfs/zhulab/wangm/work/ORF/Output/Tis-STAR
#fastqc -t 8 -0 ./ Tis_AA0_1_trim.fq.gz
#for i in {'0','5','20'};do
#cutadapt -m 24 -M 35 -u 16 --trim-n --match-read-wildcards -e 0.2 --nextseq-trim 20 -n 4 -a AGATCGGAAGAGCACACGTCTG -a AAAAAAAA -a GAACTCCAGTCAC -j 8 -o Tis_AA${i}_1_trim.fq.gz ${path}/${i}/Tis_AA${i}_rep1.fq.gz
#bowtie -x /beegfs/zhulab/wangm/Genome/Rfam/index/cotton_ncRNA -p 8 -S --un Tis_AA${i}_1_rmncRNA.fq Tis_AA${i}_1_trim.fq.gz > test.sam
#STAR --outFilterType BySJout --runThreadN 8 --outSAMattributes All --outFilterMismatchNmax 2 --genomeDir /beegfs/zhulab/wangm/Genome/Gossypium_arboreum/STAR_index/ --readFilesIn Tis_AA${i}_1_rmncRNA.fq --outFileNamePrefix Tis_AA${i}_1 --outSAMtype BAM SortedByCoordinate --quantMode TranscriptomeSAM GeneCounts --outFilterMultimapNmax 4 --outFilterMatchNmin 16 --alignEndsType EndToEnd
#samtools index Tis_AA${i}_1Aligned.sortedByCoord.out.bam
#done
#cutadapt -m 24 -M 35 -u 16 --trim-n --match-read-wildcards -e 0.2 --nextseq-trim 20 -n 4 -a AGATCGGAAGAGCACACGTCTG -a AAAAAAAA -a GAACTCCAGTCAC -j 8 -o Tis_AA10_1F_trim.fq.gz ${path}/10/Tis_AA10_F_rep1.fq.gz
#bowtie -x /beegfs/zhulab/wangm/Genome/Rfam/index/cotton_ncRNA -p 8 -S --un Tis_AA10_1F_rmncRNA.fq Tis_AA10_1F_trim.fq.gz > test.sam
#STAR --outFilterType BySJout --runThreadN 8 --outSAMattributes All --outFilterMismatchNmax 2 --genomeDir /beegfs/zhulab/wangm/Genome/Gossypium_arboreum/STAR_index/ --readFilesIn Tis_AA10_1F_rmncRNA.fq --outFileNamePrefix Tis_AA10_1F --outSAMtype BAM SortedByCoordinate --quantMode TranscriptomeSAM GeneCounts --outFilterMultimapNmax 4 --outFilterMatchNmin 16 --alignEndsType EndToEnd
#samtools index Tis_AA10_1FAligned.sortedByCoord.out.bam
#cutadapt -m 24 -M 35 -u 16 --trim-n --match-read-wildcards -e 0.2 --nextseq-trim 20 -n 4 -a AGATCGGAAGAGCACACGTCTG -a AAAAAAAA -a GAACTCCAGTCAC -j 8 -o Tis_AA10_1NO_trim.fq.gz ${path}/10/Tis_AA10_NO_rep1.fq.gz
#bowtie -x /beegfs/zhulab/wangm/Genome/Rfam/index/cotton_ncRNA -p 8 -S --un Tis_AA10_1NO_rmncRNA.fq Tis_AA10_1NO_trim.fq.gz > test.sam
#STAR --outFilterType BySJout --runThreadN 8 --outSAMattributes All --outFilterMismatchNmax 2 --genomeDir /beegfs/zhulab/wangm/Genome/Gossypium_arboreum/STAR_index/ --readFilesIn Tis_AA10_1NO_rmncRNA.fq --outFileNamePrefix Tis_AA10_1NO --outSAMtype BAM SortedByCoordinate --quantMode TranscriptomeSAM GeneCounts --outFilterMultimapNmax 4 --outFilterMatchNmin 16 --alignEndsType EndToEnd
#samtools index Tis_AA10_1NOAligned.sortedByCoord.out.bam
#bamCoverage -p 8 --bam Tis_AA0_1Aligned.sortedByCoord.out.bam --outFileName Tis_AA0.bw --normalizeUsing RPKM --binSize 10
#bamCoverage -p 8 --bam Tis_AA5_1Aligned.sortedByCoord.out.bam --outFileName Tis_AA5.bw --normalizeUsing RPKM --binSize 10
#bamCoverage -p 8 --bam Tis_AA10_1FAligned.sortedByCoord.out.bam --outFileName Tis_AA10_F.bw --normalizeUsing RPKM --binSize 10
#bamCoverage -p 8 --bam Tis_AA10_1NOAligned.sortedByCoord.out.bam --outFileName Tis_AA10_NO.bw --normalizeUsing RPKM --binSize 10
#bamCoverage -p 8 --bam Tis_AA20_1Aligned.sortedByCoord.out.bam --outFileName Tis_AA20.bw --normalizeUsing RPKM --binSize 10
#stringtie -p 8 -G /beegfs/zhulab/wangm/annotation/AA-update.gtf -e -o Tis_AA0_LTM.gtf -A Tis_AA0_LTM.tab merge0Aligned.sortedByCoord.out.bam
bamCoverage -p 4 --bam merge0Aligned.sortedByCoord.out.bam --outFileName Tis_AA0_LTM_offset_rev.bw --binSize 1 --Offset 12 --filterRNAstrand reverse
