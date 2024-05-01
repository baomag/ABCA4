#!/usr/bin/env bash
# vim: set noexpandtab tabstop=2:

indir=$(mrrdir.sh ../seurath52integrate)
outdir=$(mrrdir.sh)
#bname=ABCA4
bname=reannotated

f=$indir/reannotated_integrate.rds

slurmtaco.sh -t 10 -m 20G -n mhgcp-d02 -- seurath52int_cluster.sh -d "$outdir" -b "$bname" -- "$f"

#function cmd {
#local f=$1
#local bname=$(basename "$f" _integrate.rds)
#
#slurmtaco.sh -t 10 -m 20G -n mhgcp-d01 -- seurath52int_cluster.sh -d "$outdir" -b "$bname" -- "$f"
#}
#
#source env_parallel.bash
#env_parallel -j 8 --colsep='\t' cmd ::: "$indir"/*.rds
