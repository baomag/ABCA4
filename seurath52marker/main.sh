#!/usr/bin/env bash
# vim: set noexpandtab tabstop=2:

#indir=/storage/singlecell/maggie/ABCA4/seurath52cluster
#outdir=/storage/singlecell/maggie/ABCA4/seurath52marker
indir=$(mrrdir.sh ../seurath52cluster)
outdir=$(mrrdir.sh)

function cmd {
local id=$1
local dir=$2
echo "$id"
local f=$indir/${id}_clustering.rds
if [ -f "$f" ]
then
	slurmtaco.sh -t 2 -m 20G -n mhgcp-d03 -- seurath52marker.sh -d "$outdir" -b "$id" -n 30 -- "$f"
else
	echo "Error: $f does not exist."
fi
}

source env_parallel.bash
env_parallel -j 8 --colsep='\t' cmd :::: ../fnameinfo_multi.txt
