#!/usr/bin/env bash
# vim: set noexpandtab tabstop=2:

indir=$(mrrdir.sh ../monocle3regression/pseudotime_regress)
outdir=$(mrrdir.sh)/pseudotime_regress
bname=pseudotime_subset_treatment

function cmd {
local celltype=$1
echo "$celltype"
#local f=$indir/reannoated_early_${celltype}_treatment_sample_models.csv
#local model=$indir/reannoated_early_${celltype}_compare_treatment.csv
local f=$indir/reannoated_samples_cone_Cone_treatment_pseudotime_models.csv
local model=$indir/reannoated_samples_cone_Cone_compare_treatment.csv
if [ -f "$f" ]
then
	slurmtaco.sh -n mhgcp-d01 -- DEG_subset_treatment.sh -d "$outdir" -b "$bname" -c "$celltype" -m "$model" -q 0.01 -n 200 -F 0.5 -s 1 -- "$f"

else
	echo "Error: $f does not exist."
fi
}

source env_parallel.bash
env_parallel -j 8 --colsep='\t' cmd :::: input2.txt
