#!/usr/bin/env bash
# vim: set noexpandtab tabstop=2:

#indir=$(mrrdir.sh ../seurath52int_cluster)
outdir=$(mrrdir.sh)
f=$(mrrdir.sh ../seurath52int_cluster)/ABCA4_int_cluster.rds
#f=$(mrrdir.sh ../seurath52merge)/seuratmerge_merged.rds
bname=ABCA4_int


slurmtaco.sh -t 2 -m 20G -- seurath52split.sh -d "$outdir" -b "$bname" -s sampleid -- "$f"
#slurmtaco.sh -t 2 -m 20G -- seurath52split.sh -d "$outdir" -b "$bname" -s orig.ident -- "$f"
