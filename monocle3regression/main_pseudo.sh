#!/usr/bin/env bash
# vim: set noexpandtab tabstop=2:

indir=$(mrrdir.sh ../monocle3pseudotime)
outdir=$(mrrdir.sh)/pseudotime_regress
bname=reannoated_samples_cone
f=$indir/reannoated_samples_cone_pseudotime_cleaned.rds

slurmtaco.sh -n mhgcp-g00 -- monocle3regression.sh -d "$outdir" -b "$bname" -c Cone -- "$f"
