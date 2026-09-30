#!/bin/bash

#SBATCH -J RiboMiner
#SBATCH -p dell01
#SBATCH -N 1
#SBATCH -t 700:00:00
#SBATCH --cpus-per-task=2

cd /beegfs/zhulab/wangm/work/ORF/RiboMiner/
###Data preparation
#prepare_transcripts -g test.gtf -f /beegfs/zhulab/wangm/Genome/Gossypium_arboreum/genome.fa -o Miner_RiboCode_annot
#OutputTranscriptInfo -c Miner_RiboCode_annot/transcripts_cds.txt -g test.gtf -f Miner_RiboCode_annot/transcripts_sequence.fa -o longest.transcripts.info.txt -O all.transcripts.info.txt
#GetProteinCodingSequence -i Miner_RiboCode_annot/transcripts_sequence.fa  -c DP/longest.transcripts.info.txt -o ProteinCoding --mode whole --table 1

#cd example/
#STAR --runThreadN 8 --runMode genomeGenerate --genomeDir STARIndex/ --genomeFastaFiles /beegfs/zhulab/wangm/Genome/Gossypium_arboreum/genome.fa --sjdbGTFfile test.gtf
#STAR --outFilterType BySJout --runThreadN 8 --outSAMattributes All --outFilterMismatchNmax 2 --genomeDir ../STARIndex --readFilesIn /beegfs/zhulab/wangm/work/ORF/Output/STAR/AA-0_rep1_rmncRNA.fq --outFileNamePrefix AA0_rep1 --outSAMtype BAM SortedByCoordinate --quantMode TranscriptomeSAM GeneCounts --outFilterMultimapNmax 4 --outFilterMatchNmin 16 --alignEndsType EndToEnd
#samtools sort -@ 8 AA0_rep1Aligned.toTranscriptome.out.bam -o AA0_rep1Aligned.toTranscriptome.sort.bam
#samtools index AA0_rep1Aligned.toTranscriptome.sort.bam
#metaplots -a ../Miner_RiboCode_annot -r AA0_rep1Aligned.toTranscriptome.sort.bam -o AA0_Meta

###MA
#MetageneAnalysisForTheWholeRegions -f attributes.test -c longest.transcripts.info.txt -o RiboMiner_MA -b 15,90,60 -l 100 -n 10 -m 1 -e 5 --plot yes
PlotMetageneAnalysisForTheWholeRegions -i RiboMiner_MA_scaled_density_dataframe.txt -o AA0vs5 -g AA0,AA5 -r AA0-1,AA0-2__AA5-1,AA5-2 -b 15,90,60 --mode all
