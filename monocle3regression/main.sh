#!/usr/bin/env bash
# vim: set noexpandtab tabstop=2:

indir=$(mrrdir.sh ../monocle3convert)
outdir=$(mrrdir.sh)/new_compare
#bname=merged_data
#bname=patient
#bname=reannoated_JONR_Control
bname=reannoated_early_samples

function cmd {
local celltype=$1
echo "$celltype"
#local f=$indir/merged_data_${celltype}_convert.rds
#local f=$indir/patient_${celltype}_convert.rds
local f=$indir/reannotated_early_samples_${celltype}_convert.rds
if [ -f "$f" ]
then
	slurmtaco.sh -n mhgcp-d02 -- monocle3regression.sh -d "$outdir" -b "$bname" -c "$celltype" -- "$f"

else
	echo "Error: $f does not exist."
fi
}

source env_parallel.bash
env_parallel -j 8 --colsep='\t' cmd :::: input.txt
