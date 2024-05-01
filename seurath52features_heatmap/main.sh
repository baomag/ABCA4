#!/usr/bin/env bash
# vim: set noexpandtab tabstop=2:

indir=$(mrrdir.sh ../seurath52UMAP)
outdir=$(mrrdir.sh)
f=$indir/scvi_MG_reannotated_ABCA4_clustered.rds
genes=selected_celltype_markers.txt
#genes=celltype_markers.txt
#bname=scvi_annotated_ABCA4
bname=scvi_MG_reannotated_ABCA4

slurmtaco.sh -t 2 -n mhgcp-g01 -- seurath52features_heatmap.sh -d "$outdir" -b "$bname" -s "$genes" -g celltype -- "$f"

