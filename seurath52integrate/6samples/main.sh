#!/usr/bin/env bash
# vim: set noexpandtab tabstop=2:

indir=$(mrrdir.sh ../../seurath52add_meta)
outdir=$(mrrdir.sh ../)
sampleids=(
10x3v31_Organoid_JONR1_D135
10x3v31_Organoid_JONR_D262
10x3v31_Organoid_NHDF2_D146
10x3v31_Organoid_NHDF_D261
10x3v31_Organoid_SONR1_D135
10x3v31_Organoid_SONR_D262
)
files=($(newlines.sh -- "${sampleids[@]}" | pendlines.sh -p "$indir"/ -s _add_meta.rds))
bname=integrate6

slurmtaco.sh -t 4 -b -m 80G -p short -n mhgcp-d01 -- seurath52integrate.sh -t 10 -d "$outdir" -b "$bname" -- "${files[@]}"&
