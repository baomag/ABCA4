#!/usr/bin/env bash
# vim: set noexpandtab tabstop=2:

indir=$(mrrdir.sh ../seurath52merge)
outdir=$(mrrdir.sh)
f=$indir/reannotated_late_samples_merged.rds
degs=Cone_Late_DEG.txt

slurmtaco.sh -t 2 -m 20G -n mhgcp-d03 -- DEG_pheatmap.sh -d "$outdir" -b Cone_Late_DEG -s "$degs" -- "$f"
#slurmtaco.sh -t 2 -m 20G -n mhgcp-d03 -- DEG_pheatmap.sh -d "$outdir" -b Rod_Late_DEG -s "$degs" -- "$f"
