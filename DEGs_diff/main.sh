#!/usr/bin/env bash
# vim: set noexpandtab tabstop=2:

indir=$(mrrdir.sh ..)
outdir=$(mrrdir.sh)
bname=treatment

function cmd {
local celltype=$1
echo "$celltype"
local f=$indir/DEG_subset_treatment/subset_treatment_${celltype}_sorted_model.csv
local model=$indir/DEG_subset_sample/subset_sample_${celltype}_sorted_model.csv
if [ -f "$f" ]
then
	slurmtaco.sh -n mhgcp-d02 -- DEGs_diff.sh -d "$outdir" -b "$bname" -c "$celltype" -m "$model" -- "$f"

else
	echo "Error: $f does not exist."
fi
}

source env_parallel.bash
env_parallel -j 8 --colsep='\t' cmd :::: input.txt
