#!/usr/bin/env bash
# vim: set noexpandtab tabstop=2:

# outdir=/storage/singlecell/maggie/ABCA4/seurath52clean
outdir=$(mrrdir.sh)

function cmd {
local id=$1
local dir=$2
#local f=$dir/outs/filtered_feature_bc_matrix.h5
local f=$dir/filtered_feature_bc_matrix.h5
if [ -f "$f" ]
then
	slurmtaco.sh -t 2 -m 20G -n mhgcp-d02 -- seurath52clean.sh -d "$outdir" -b "$id" -m 10 -n 200 -- "$f"
	#	slurmtaco.sh -t 2 -m 20G -- seurath52clean.sh -d "$outdir" -b "$id" -m 10 -n 200 -- "$f"
else
	echo "Error: $f does not exist."
fi
}

source env_parallel.bash
env_parallel --colsep='\t' cmd :::: ../controlinfo2.txt
#env_parallel --colsep='\t' cmd :::: ../fnameinfo.txt
#env_parallel --colsep='\t' cmd :::: ../nu.txt
