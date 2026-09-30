#!/bin/bash

#SBATCH -J Ath
#SBATCH -p fat
#SBATCH -N 1
#SBATCH -t 700:00:00
#SBATCH --cpus-per-task=4

cd /beegfs/zhulab/wangm/work/ORF/Other_Spelices/bowtie/AthAlign/
#bowtie -x /beegfs/zhulab/wangm/Genome/Arabidopsis_thaliana/bowtieIndex/Ath_ncRNA_index -p 8 -S --un Ath_rmncRNA.fq ../cutadapt/Ath_FastqMerge_trim.fq.gz > test.sam
#fastqc -t 8 -o ./ Ath_rmncRNA.fq
#seqkit split2 Ath_rmncRNA.fq -p 10
#for i in {"01","02","03","04","05","06","07","08","09","10"};do
#STAR --outFilterType BySJout --limitBAMsortRAM 8469960077 --runThreadN 8 --outSAMattributes All --outFilterMismatchNmax 2 --genomeDir /beegfs/zhulab/wangm/Genome/Arabidopsis_thaliana/STARIndex --readFilesIn ../Ath_rmncRNA.fq.split/Ath_rmncRNA.part_0${i}.fq --outFileNamePrefix Ath${i} --outSAMtype BAM SortedByCoordinate --quantMode TranscriptomeSAM GeneCounts --outFilterMultimapNmax 4 --outFilterMatchNmin 16 --alignEndsType EndToEnd
#done
#samtools merge -@ 8 Ath.merge.bam *.sortedByCoord.out.bam
#samtools sort -@ 8 -o Ath.merge.sort.bam Ath.merge.bam
#samtools index Ath.merge.sort.bam
#samtools merge -@ 8 Ath.merge.Tran.bam *.toTranscriptome.out.bam
#prepare_transcripts -g /beegfs/zhulab/wangm/Genome/Arabidopsis_thaliana/Arabidopsis_thaliana.TAIR10.57.update.gtf -f /beegfs/zhulab/wangm/Genome/Arabidopsis_thaliana/Arabidopsis_thaliana.TAIR10.dna.toplevel.fa -o Ath_RiboCode_annot
#metaplots -a Ath_RiboCode_annot -r Ath.merge.Tran.bam
RiboCode -a Ath_RiboCode_annot -c metaplots_pre_config.txt -l no -g -o Ath_RiboCode_ORFs_result -A AAG,ACG,AGG,ATA,ATC,ATT,CTG,GTG,TTG




