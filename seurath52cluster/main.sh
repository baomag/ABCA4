#!/usr/bin/env bash
# vim: set noexpandtab tabstop=2:

# indir=/storage/singlecell/maggie/ABCA4/seurath52clean
# outdir=/storage/singlecell/maggie/ABCA4/seurath52cluster
indir=$(mrrdir.sh ../seurath52normalize)
outdir=$(mrrdir.sh)

function cmd {
local id=$1
local dir=$2
echo "$id"
local f=$indir/${id}_normalized.rds
if [ -f "$f" ]
then
	slurmtaco.sh -t 2 -m 20G -n mhgcp-d02 -- seurath52cluster.sh -d "$outdir" -b "$id" -p 30 -- "$f"
else
	echo "Error: $f does not exist."
fi
}

source env_parallel.bash
env_parallel -j 8 --colsep='\t' cmd :::: ../fnameinfo_tomreh.txt
