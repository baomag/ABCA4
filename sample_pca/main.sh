#!/usr/bin/env bash
# vim: set noexpandtab tabstop=2:

#f=$(mrrdir.sh ../seurath52merge)/pca_samples_merged.rds
#f=$(mrrdir.sh ../seurath52merge)/multi_control_pca_samples_merged.rds
f=$(mrrdir.sh ../seurath52merge)/tomreh_control_pca_samples_merged_specific_timepoint.rds
outdir=$(mrrdir.sh)
#bname=sample_pca_orig
#bname=multi_control_pca_labeled
bname=tomreh_selected_control_pca_unlabeled

slurmtaco.sh -t 2 -m 20G -n mhgcp-d03 -b -- sample_pca.sh -d "$outdir" -b "$bname" -n 2000 -- "$f"&
#slurmtaco.sh -t 2 -m 20G -n mhgcp-d01 -- sample_pca.sh -d "$outdir" -b "$bname" -n 2000 -C TRUE -- "$f"
#slurmtaco.sh -t 2 -m 20G -n mhgcp-d01 -- sample_pca.sh -d "$outdir" -b "$bname" -n 2000 -R TRUE -- "$f"
#slurmtaco.sh -t 2 -m 20G -n mhgcp-d01 -- sample_pca.sh -d "$outdir" -b "$bname" -n 2000 -p TRUE -- "$f"
