#!/usr/bin/env bash
# vim: set noexpandtab tabstop=2:

indir=$(mrrdir.sh ../seurath52add_meta/temp_merging_group)
files=("$indir"/*_add_meta.rds)
outdir=$(mrrdir.sh)
#sampleids=(
#10x3v31_Organoid_JONR1_D135
#10x3v31_Organoid_JONR_D262
#10x3v31_Organoid_SONR1_D135
#10x3v31_Organoid_SONR_D262
#)
#files=($(newlines.sh -- "${sampleids[@]}" | pendlines.sh -p "$indir"/ -s _add_time_treatment.rds))
#bname=patient
#bname=multi_control_pca_samples
#bname=reannotated_samples
bname=tomreh_controls_merged.rds

slurmtaco.sh -t 10 -m 20G -n mhgcp-d02 -- seurath52merge.sh -t 10 -d "$outdir" -b "$bname" -- "${files[@]}"
