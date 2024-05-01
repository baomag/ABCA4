#!/usr/bin/env bash
# vim: set noexpandtab tabstop=2:

indir=$(mrrdir.sh ../DEGs_diff)
outdir=$(mrrdir.sh)
f=$indir/treatment_Cone_sorted_model.csv

slurmtaco.sh -t 2 -m 20G -n mhgcp-d02 -- DEG_enhanced_volcano.sh -d "$outdir" -b cone_DEGs  -- "$f"
