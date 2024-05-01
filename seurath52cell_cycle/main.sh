#!/usr/bin/env bash
# vim: set noexpandtab tabstop=2:

indir=$(mrrdir.sh ../seurath52merge)
outdir=$(mrrdir.sh)
f=$indir/reannotated_samples_merged.rds
bname=reannotated_samples

slurmtaco.sh -t 2 -m 20G -n mhgcp-d03 -- seurath52cell_cycle.sh -d "$outdir" -b "$bname" -- "$f"

#function cmd {
#local id=$1
#local dir=$2
#echo "$id"
#local f=$indir/${id}_normalized.rds
#if [ -f "$f" ]
#then
#	slurmtaco.sh -t 2 -m 20G -n mhgcp-d03 -- seurath52cluster.sh -d "$outdir" -b "$id" -p 30 -- "$f"
#else
#	echo "Error: $f does not exist."
#fi
#}
#
#source env_parallel.bash
#env_parallel -j 8 --colsep='\t' cmd :::: ../fnameinfo_multi.txt
