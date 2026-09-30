#!/bin/bash

#SBATCH -J Zma
#SBATCH -p fat
#SBATCH -N 1
#SBATCH -t 700:00:00
#SBATCH --cpus-per-task=4

cd /beegfs/zhulab/wangm/work/ORF/Other_Spelices/bowtie/ZmaAlign
#bowtie -x /beegfs/zhulab/wangm/Genome/Zea_mays/bowtieIndex/Zma_ncRNA_index -p 8 -S --un Zma_rmncRNA.fq ../../cutadapt/Zma_trimmmed.fq.gz > test.sam
#STAR --outFilterType BySJout --runThreadN 8 --outSAMattributes All --outFilterMismatchNmax 2 --genomeDir /beegfs/zhulab/wangm/Genome/Zea_mays/STARIndex/ --readFilesIn Zma_rmncRNA.fq --outFileNamePrefix Zma --outSAMtype BAM SortedByCoordinate --quantMode TranscriptomeSAM GeneCounts --outFilterMultimapNmax 4 --outFilterMatchNmin 16 --alignEndsType EndToEnd
#prepare_transcripts -g /beegfs/zhulab/wangm/Genome/Zea_mays/Zea_mays.Zm-B73-REFERENCE-NAM-5.0.57.update.gtf -f /beegfs/zhulab/wangm/Genome/Zea_mays/Zea_mays.Zm-B73-REFERENCE-NAM-5.0.dna.toplevel.fa -o Zma_RiboCode_annot
#metaplots -a Zma_RiboCode_annot -r ZmaAligned.toTranscriptome.out.bam
RiboCode -a Zma_RiboCode_annot -c metaplots_pre_config.new.txt -l no -g -o Zma_RiboCode_ORFs_result -A AAG,ACG,AGG,ATA,ATC,ATT,CTG,GTG,TTG




