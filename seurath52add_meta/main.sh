#!/usr/bin/env bash
# vim: set noexpandtab tabstop=2:

#indir=$(mrrdir.sh ../seurath52name)
indir=$(mrrdir.sh ../seurath52cluster)
outdir=$(mrrdir.sh)

function cmd {
local id=$1
local dir=$2
local f=$indir/${id}_clustering.rds
if [ -f "$f" ]
then
	slurmtaco.sh -t 2 -m 20G -n mhgcp-d02 -- seurath52add_meta.sh -d "$outdir" -b "$id" -- "$f"
else
	echo "Error: $f does not exist."
fi
}

source env_parallel.bash
env_parallel -j 8 --colsep='\t' cmd :::: ../fnameinfo_tomreh.txt
