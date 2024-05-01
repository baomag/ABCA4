#!/usr/bin/env bash
# vim: set noexpandtab tabstop=2:

indir=$(mrrdir.sh ../monocle3pseudotime)
outdir=$(mrrdir.sh)
bname=cone_markers
f=$indir/reannoated_samples_cone_pseudotime_cleaned.rds

slurmtaco.sh -n mhgcp-d03 -- monocle3pseudotime_plots.sh -d "$outdir" -b "$bname" -- "$f"
