#!/usr/bin/env bash
# vim: set noexpandtab tabstop=2:

outdir=$(mrrdir.sh)
#indir=$(mrrdir.sh ../seurath52add_meta)
marker=selected_markers.txt
#marker=/storage/chen/home/u244209/ABCA4/selected_marker_dotplot.txt
indir=$(mrrdir.sh ../seurath52merge)
f=$indir/reannotated_samples_merged.rds
#indir=$(mrrdir.sh ../seurath52split)
#f=$indir/merged_data_ident_split.rds
#marker=/storage/chen/home/u244209/ABCA4/selected_marker_dotplot.txt
bname=merged_g2m_celltype

slurmtaco.sh -t 2 -m 20G -n mhgcp-d03 -- seurath52dot.sh -d "$outdir" -b "$bname" -m "$marker" -- "$f"

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
