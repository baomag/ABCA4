#!/usr/bin/env bash
# vim: set noexpandtab tabstop=2:

indir=$(mrrdir.sh ../monocle3regression)
outdir=$(mrrdir.sh)
bname=subset_sample

function cmd {
local celltype=$1
echo "$celltype"
local f=$indir/patient_${celltype}_sample_time_models.csv
local model=$indir/patient_${celltype}_compare_sample.csv
if [ -f "$f" ]
then
	slurmtaco.sh -n mhgcp-d03 -- DEG_subset_sample.sh -d "$outdir" -b "$bname" -c "$celltype" -m "$model" -q 0.01 -n 200 -F 0.5 -s 1 -- "$f"

else
	echo "Error: $f does not exist."
fi
}

source env_parallel.bash
env_parallel -j 8 --colsep='\t' cmd :::: input.txt
