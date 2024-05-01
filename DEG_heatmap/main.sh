#!/usr/bin/env bash
# vim: set noexpandtab tabstop=2:

indir=$(mrrdir.sh ../seurath52merge)
outdir=$(mrrdir.sh)
f=$indir/pca_samples_merged.rds
degs=selected_DEGs_temp.txt

slurmtaco.sh -t 2 -m 20G -n mhgcp-d02 -- DEG_heatmap.sh -d "$outdir" -b cone_treatment -s "$degs" -g treatment -- "$f"
slurmtaco.sh -t 2 -m 20G -n mhgcp-d02 -- DEG_heatmap.sh -d "$outdir" -b cone_sampleid -s "$degs" -g sampleid -- "$f"

