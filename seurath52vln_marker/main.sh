#!/usr/bin/env bash
# vim: set noexpandtab tabstop=2:

indir=$(mrrdir.sh ../seurath52marker)
outdir=$(mrrdir.sh)
marker=/storage/chen/home/u244209/ABCA4/hs_marker.txt

function cmd {
local id=$1
local dir=$2
local celltype=$3
echo "$id"
local f=$indir/${id}_biomarker.rds
if [ -f "$f" ]
then
	slurmtaco.sh -t 1 -m 20G -n mhgcp-d03 -- seurath52vln_marker.sh -d "$outdir" -b "${id}_${celltype}" -m "$marker" -c "$celltype" -- "$f"
else
	echo "Error: $f does not exist."
fi
}

source env_parallel.bash
env_parallel --colsep='\t' cmd :::: ../fnameinfo_final.txt ::: $(cut -f 1 < "$marker" | tail -n +2 | sort -u)
