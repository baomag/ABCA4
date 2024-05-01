#!/usr/bin/env bash
# vim: set noexpandtab tabstop=2:

indir=/storage/chen/home/u244209/ABCA4/go_full_run/rds

function cmd {
local id=$1
echo "$id"
#local f=$indir/reannotated_early_samples_${id}.rds
#local f=$indir/reannotated_Late_samples_${id}.rds
local f=$indir/${id}_Specific.rds
echo "$f"
generds=/storage/chen/home/u244209/ABCA4/go_full_run/obj_totalGenes.rds
#local bname=${id}_early
#local bname=${id}_Late
local bname=${id}_Specific
echo "$bname"
if [ -f "$f" ]
then
	slurmtaco.sh -m 20G -n mhgcp-d03 -b -- Rscript run_GOpathwayFromDEGs_v2.R "$f" "$bname" "$generds"&
else
	echo "Error: $f does not exist."
fi
}

source env_parallel.bash
env_parallel -j 8 --colsep='\t' cmd :::: input2.txt
echo "process was done"
