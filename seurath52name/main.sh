#!/usr/bin/env bash
# vim: set noexpandtab tabstop=2:

indir=$(mrrdir.sh ../seurath52marker)
outdir=$(mrrdir.sh)
idsdir=/storage/chen/home/u244209/ABCA4/seurath52annotation

function cmd {
local id=$1
local dir=$2
local f=$indir/${id}_biomarker.rds
local ids=$idsdir/${id}_annotation.txt
if [ -f "$f" ] && [ -f "$ids" ]
then
	slurmtaco.sh -t 2 -m 20G -n mhgcp-d02 -- seurath52name.sh -d "$outdir" -b "$id" -i "$ids" -- "$f"
else
	echo "Error: $f does not exist."
fi
}

source env_parallel.bash
env_parallel -j 8 --colsep='\t' cmd :::: ../fnameinfo_final.txt
