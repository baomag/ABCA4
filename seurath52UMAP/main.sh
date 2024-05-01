#!/usr/bin/env bash
# vim: set noexpandtab tabstop=2:

#indir=$(mrrdir.sh ../seurath52int_cluster)
#indir=$(mrrdir.sh ../seurath52merge)
#indir=$(mrrdir.sh ../scvi_annotation)
indir=$(mrrdir.sh)
outdir=$(mrrdir.sh)
#bname=ABCA4
#f=$indir/ABCA4_int_cluster.rds
#f=$indir/reannotated_samples_merged.rds
#bname=reannotated_merged
#f=$indir/reannotated_int_cluster.rds
#f=$indir/scvi_annotated_ABCA4_int_cluster.rds
#f=$indir/scvi_annotated_ABCA4.rds
#f=$indir/scvi_MG_reannotated_ABCA4_int_cluster.rds
#bname=reannotated_integrated
#bname=scvi_annotated_ABCA4
#bname=scvi_MG_reannotated_ABCA4

# Remember to change -C option if clustering was done or not done earlier
#slurmtaco.sh -t 2 -m 20G -n mhgcp-d02 -- seurath52UMAP.sh -d "$outdir" -b "$bname" -C TRUE -- "$f"

function cmd {
local id=$1
local dir=$2
echo "$id"
local f=$indir/${id}_scvi_MG_reannotated_ABCA4_clustered.rds
if [ -f "$f" ]
then
	slurmtaco.sh -t 2 -n mhgcp-d02 -- seurath52UMAP.sh -d "$outdir" -b "$id" -C FALSE -- "$f"
else
	echo "Error: $f does not exist."
fi
}

source env_parallel.bash
env_parallel -j 8 --colsep='\t' cmd :::: ../fnameinfo_final.txt
