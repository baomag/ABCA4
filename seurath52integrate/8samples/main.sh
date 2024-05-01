#!/usr/bin/env bash
# vim: set noexpandtab tabstop=2:

outdir=$(mrrdir.sh ../)
indir=/storage/singlecell/maggie/ABCA4/seurath52add_meta
files=("$indir"/*.rds)
bname=integrate8

slurmtaco.sh -t 4 -m 80G -p short -n mhgcp-d01 -- seurath52integrate.sh -t 10 -d "$outdir" -b "$bname" -- "${files[@]}"
