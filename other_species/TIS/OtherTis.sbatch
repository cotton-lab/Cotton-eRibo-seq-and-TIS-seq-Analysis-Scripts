#!/bin/bash

#SBATCH -J TisJob
#SBATCH -p dell01
#SBATCH -N 1
#SBATCH -t 700:00:00
#SBATCH --cpus-per-task=8

cd /beegfs/zhulab/wangm/work/ORF/Other_Spelices/Tis
#prepare_transcripts -g /beegfs/zhulab/wangm/annotation/AA-UTR-update.gtf -f /beegfs/zhulab/wangm/Genome/Gossypium_arboreum/genome.fa -o AAutr_RiboCode_annot

#fastqc -t 8 -o ./ Ath_trim.fq.gz
#Ath
#cutadapt -m 24 -M 35 --trim-n --match-read-wildcards -e 0.2 --nextseq-trim 20 -a CTGTAGGCACCATCAAT -j 8 -o Ath_trim.fq.gz /beegfs/zhulab/wangm/work/Tis-seq/Ath/SRR4424237.fastq.gz
#bowtie -x /beegfs/zhulab/wangm/Genome/Arabidopsis_thaliana/bowtieIndex/Ath_ncRNA_index -p 8 -S --un Ath_rmncRNA.fq Ath_trim.fq.gz > test.sam
#STAR --outFilterType BySJout --runThreadN 8 --outSAMattributes All --outFilterMismatchNmax 2 --genomeDir /beegfs/zhulab/wangm/Genome/Arabidopsis_thaliana/STARIndex/ --readFilesIn Ath_rmncRNA.fq --outFileNamePrefix AthTis --outSAMtype BAM SortedByCoordinate --quantMode TranscriptomeSAM GeneCounts --outFilterMultimapNmax 4 --outFilterMatchNmin 16 --alignEndsType EndToEnd
#samtools index AthTisAligned.sortedByCoord.out.bam
ribotish quality -b AthTisAligned.sortedByCoord.out.bam -g /beegfs/zhulab/wangm/Genome/Arabidopsis_thaliana/Arabidopsis_thaliana.TAIR10.57.update.gtf -t
ribotish predict -t AthTisAligned.sortedByCoord.out.bam -g /beegfs/zhulab/wangm/Genome/Arabidopsis_thaliana/Arabidopsis_thaliana.TAIR10.57.update.gtf -f /beegfs/zhulab/wangm/Genome/Arabidopsis_thaliana/Arabidopsis_thaliana.TAIR10.dna.toplevel.fa -o Ath_Ribotish_pred.txt --alt -p 8 --seq --aaseq --inframecount --longest

#Sly
#cutadapt -m 24 -M 35 --trim-n --match-read-wildcards -e 0.2 --nextseq-trim 20 -a CTGTAGGCACCATCAAT -j 8 -o Sly_trim.fq.gz /beegfs/zhulab/wangm/work/Tis-seq/Sly/SRR10851992.fastq.gz
#bowtie -x /beegfs/zhulab/wangm/Genome/Solanum_lycopersicum/bowtieIndex/Sly_ncRNA_index -p 8 -S --un Sly_rmncRNA.fq Sly_trim.fq.gz > test.sam
#STAR --outFilterType BySJout --runThreadN 8 --outSAMattributes All --outFilterMismatchNmax 2 --genomeDir /beegfs/zhulab/wangm/Genome/Solanum_lycopersicum/STARIndex/ --readFilesIn Sly_rmncRNA.fq --outFileNamePrefix SlyTis --outSAMtype BAM SortedByCoordinate --quantMode TranscriptomeSAM GeneCounts --outFilterMultimapNmax 4 --outFilterMatchNmin 16 --alignEndsType EndToEnd
#samtools index SlyTisAligned.sortedByCoord.out.bam
ribotish quality -b SlyTisAligned.sortedByCoord.out.bam -g /beegfs/zhulab/wangm/Genome/Solanum_lycopersicum/ITAG4.0_gene_models.update.gtf -t
ribotish predict -t SlyTisAligned.sortedByCoord.out.bam -g /beegfs/zhulab/wangm/Genome/Solanum_lycopersicum/ITAG4.0_gene_models.update.gtf -f /beegfs/zhulab/wangm/Genome/Solanum_lycopersicum/S_lycopersicum_chromosomes.4.00.fa -o Sly_Ribotish_pred.new.txt --alt -p 8 --seq --aaseq --inframecount --longest




