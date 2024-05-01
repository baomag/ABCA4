#!/usr/bin/env bash
# vim: set noexpandtab tabstop=2:

outdir=$(mrrdir.sh)
#features=cellcycle_markers.csv
features=selected_cellcycle_markers.txt
indir=$(mrrdir.sh ../seurath52int_cluster)
f=$indir/reannotated_int_cluster.rds
#bname=cellcycle
bname=selected_cellcycle

slurmtaco.sh -t 2 -m 20G -n mhgcp-d01 -b -- seurath52gene_module.sh -d "$outdir" -b "$bname" -f "$features" -- "$f"&

#function cmd {
#local id=$1
#local dir=$2
#local celltype=$3
#echo "$id"
#local f=$indir/${id}_add_meta.rds
#if [ -f "$f" ]
#then
#	slurmtaco.sh -t 1 -m 20G -n mhgcp-d01 -- seurath52dot.sh -d "$outdir" -b "$id"_MG_RPC -m "$marker" -- "$f"
#else
#	echo "Error: $f does not exist."
#fi
#}
#
#source env_parallel.bash
##env_parallel -j 8 --colsep='\t' cmd :::: ../controlinfo.txt
#env_parallel -j 8 --colsep='\t' cmd :::: ../fnameinfo_final.txt
