#!/bin/bash

#SBATCH -J Sly
#SBATCH -p fat
#SBATCH -N 1
#SBATCH -t 700:00:00
#SBATCH --cpus-per-task=4

cd /beegfs/zhulab/wangm/work/ORF/Other_Spelices/bowtie
#bowtie -x /beegfs/zhulab/wangm/Genome/Solanum_lycopersicum/bowtieIndex/Sly_ncRNA_index -p 8 -S --un Sly_rmncRNA.fq ../cutadapt/Sly_FastqMerge_trim.fq.gz > test.sam
cd SlyAlign
#STAR --outFilterType BySJout --runThreadN 8 --outSAMattributes All --outFilterMismatchNmax 2 --genomeDir /beegfs/zhulab/wangm/Genome/Solanum_lycopersicum/STARIndex/ --readFilesIn ../Sly_rmncRNA.fq --outFileNamePrefix Sly --outSAMtype BAM SortedByCoordinate --quantMode TranscriptomeSAM GeneCounts --outFilterMultimapNmax 4 --outFilterMatchNmin 16 --alignEndsType EndToEnd
prepare_transcripts -g /beegfs/zhulab/wangm/Genome/Solanum_lycopersicum/ITAG4.0_gene_models.update.gtf -f /beegfs/zhulab/wangm/Genome/Solanum_lycopersicum/S_lycopersicum_chromosomes.4.00.fa -o test_RiboCode_annot
#metaplots -a Sly_RiboCode_annot -r SlyAligned.toTranscriptome.out.bam
#RiboCode -a Sly_RiboCode_annot -c metaplots_pre_config.txt -l no -g -o Sly_RiboCode_ORFs_result -A AAG,ACG,AGG,ATA,ATC,ATT,CTG,GTG,TTG




