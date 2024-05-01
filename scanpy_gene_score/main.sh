#!/bin/bash

indir=$(mrrdir.sh ../seurath52merge)
infile=$indir/reannotated_samples_merged.h5ad

outdir=$(mrrdir.sh)
#outfig=$outdir/overall_umap_by_cell_cycle_score.png
outfig=$outdir/overall_umap_by_selected_cell_cycle_score.png
#outfile=$outdir/reannoated_sampels_merged_gene_score.h5ad
outfile=$outdir/reannoated_sampels_selected_merged_gene_score.h5ad

slurmtaco.sh -t 2 -m 20G -n mhgcp-d01 -b -- python /storage/chen/home/u244209/wrapper/src/scanpy_gene_score/python/scanpy_gene_score.py $1 "$infile" $2 "$outfig" $3 "$outfile"&
