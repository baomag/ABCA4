#!/usr/bin/env bash
# vim: set noexpandtab tabstop=2:

#indir=$(mrrdir.sh ../seurath52merge)
indir=$(mrrdir.sh ../seurath52UMAP)
outdir=$(mrrdir.sh)
#f=$indir/seuratmerge_merged.rds
#f=$indir/patient_merged.rds
#f=$indir/reannotated_JONR_Control_merged.rds
#f=$indir/reannotated_early_samples_merged.rds
#f=$indir/reannotated_samples_merged.rds
f=$indir/scvi_MG_reannotated_ABCA4_clustered.rds
#bname=merged_data
#bname=patient
#bname=reannotated_JONR_Control
#bname=reannotated_early_samples
bname=scvi_MG_reannotated_ABCA4

function cmd {
local celltype=$1
echo "$celltype"
if [ -f "$f" ]
then
	slurmtaco.sh -n mhgcp-d02 -- monocle3convert.sh -d "$outdir" -b "$bname" -c "$celltype" -- "$f"
else
	echo "Error: $f does not exist."
fi
}

source env_parallel.bash
env_parallel -j 8 --colsep='\t' cmd :::: input2.txt
