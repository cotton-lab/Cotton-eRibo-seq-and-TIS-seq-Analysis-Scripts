# Additional analysis notebooks

This directory contains six Jupyter notebooks supplied separately as
`代码整理-260703.zip`. They are organized as downstream analysis modules and
are kept separate from the SLURM scripts in the main workflow.

## `part1_rRNA_analysis`

- `analysis1_rRNA_ratio.ipynb`: calculates rRNA composition from species-level
  depth tables and produces a stacked bar plot.
- `analysis2_rRNA_depthHeatmap.ipynb`: visualizes rRNA depth profiles for
  Arabidopsis, rice, cotton, tomato and maize. The notebook excludes 5S rRNA
  from the displayed heatmaps.
- `analysis3_rRNA_divergence.ipynb`: calculates sliding-window sequence
  divergence from pairwise rRNA alignments for 18S, 5.8S and 28S/25S regions.

## `part2_multiORF_analysis`

- `analysis1_multiTIS_result.ipynb`: filters and summarizes cotton multi-TIS
  records and performs selected N-terminal/domain/signal-peptide analyses.
- `analysis2_multiTIS_conserved.ipynb`: summarizes cross-species multi-TIS
  conservation from precomputed clustering results.
- `analysis3_multiTIS_supportedbyCage_and_Pacbio.ipynb`: evaluates support for
  multi-TIS genes using CAGE and PacBio-derived evidence.

## Input categories referenced by the notebooks

The notebooks reference rRNA annotation/depth tables, pairwise alignment FASTA
files, ORF FASTA files, InterProScan and SignalP result tables, CAGE/PacBio
tables and precomputed clustering results.
