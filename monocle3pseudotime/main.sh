#!/usr/bin/env bash
# vim: set noexpandtab tabstop=2:

indir=$(mrrdir.sh ../monocle3convert)
outdir=$(mrrdir.sh)
#bname=reannoated_samples_cone
#f=$indir/reannotated_samples_Cone_convert.rds
#bname=scvi_annotated_ABCA4
#f=$indir/scvi_annotated_ABCA4_convert.rds
f=$indir/scvi_MG_reannotated_ABCA4_convert.rds
bname=scvi_MG_reannotated_ABCA4

slurmtaco.sh -n mhgcp-g01 -- monocle3pseudotime.sh -d "$outdir" -b "$bname" -n 50 -- "$f"
