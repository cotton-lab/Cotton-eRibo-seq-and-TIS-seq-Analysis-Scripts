#!/bin/bash

#SBATCH -J Osa
#SBATCH -p cpu
#SBATCH -N 1
#SBATCH -t 700:00:00
#SBATCH --cpus-per-task=4

cd /beegfs/zhulab/wangm/work/ORF/Other_Spelices/bowtie/OsaAlign/
#bowtie -x /beegfs/zhulab/wangm/Genome/Oryza_sativa/bowtieIndex/Osa_ncRNA_index -p 8 -S --un Osa_rmncRNA.fq ../cutadapt/Osa_FastqMerge_trim.fq.gz > test.sam
#seqkit split Osa_rmncRNA.fq -p 4
#for i in {"01","02","03","04","05","06","07","08","09","10","11","12","13","14","15","16","17","18","19","20"};do
#STAR --outFilterType BySJout --limitBAMsortRAM 6469960077 --runThreadN 8 --outSAMattributes All --outFilterMismatchNmax 2 --genomeDir /beegfs/zhulab/wangm/Genome/Oryza_sativa/STARIndex --readFilesIn ../Osa_rmncRNA.fq.split/Osa_rmncRNA.part_011.fq --outFileNamePrefix Osa11 --outSAMtype BAM SortedByCoordinate --quantMode TranscriptomeSAM GeneCounts --outFilterMultimapNmax 4 --outFilterMatchNmin 16 --alignEndsType EndToEnd
#done
#samtools merge -@ 8 Osa.merge.bam *.sortedByCoord.out.bam
#samtools sort -@ 8 -o Osa.merge.sort.bam Osa.merge.bam
#samtools index Osa.merge.sort.bam
#samtools merge -@ 8 Osa.merge.Tran.bam *.toTranscriptome.out.bam
#prepare_transcripts -g /beegfs/zhulab/wangm/Genome/Oryza_sativa/Oryza_sativa.IRGSP-1.0.57.update.gtf -f /beegfs/zhulab/wangm/Genome/Oryza_sativa/Oryza_sativa.IRGSP-1.0.dna.toplevel.fa -o Osa_RiboCode_annot
#metaplots -a Osa_RiboCode_annot -r Osa.merge.Tran.bam
RiboCode -a Osa_RiboCode_annot -c metaplots_pre_config.txt -l no -g -o Osa_RiboCode_ORFs_result -A AAG,ACG,AGG,ATA,ATC,ATT,CTG,GTG,TTG
