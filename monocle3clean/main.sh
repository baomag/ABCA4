#!/usr/bin/env bash
# vim: set noexpandtab tabstop=2:

indir=$(mrrdir.sh ../seurath52merge)
outdir=$(mrrdir.sh)
f=$indir/seuratmerge_merged.rds
bname=merged_data
meta=$indir/seuratmerge_merged_metadata.txt
samples=(10x3v31_Organoid_JONR1_D135
10x3v31_Organoid_JONR_D262
10x3v31_Organoid_NHDF2_D146
10x3v31_Organoid_NHDF_D261
10x3v31_Organoid_SONR1_D135
10x3v31_Organoid_SONR_D262)

slurmtaco.sh -n mhgcp-d02 -- monocle3clean.sh -d "$outdir" -b "$bname" -m "$meta" -c AC $(basharr2cmdopts.sh -o -s -- "${samples[@]}") -- "$f"

#function cmd {
#local id=$1
#local dir=$2
#echo "$id"
#local f=$indir/${id}_clustering.rds
#if [ -f "$f" ]
#then
#	slurmtaco.sh -t 2 -m 20G -n mhgcp-d01 -- seurath52cluster.sh -d "$outdir" -b "$id" -- "$f"
#else
#	echo "Error: $f does not exist."
#fi
#}

#source env_parallel.bash
#env_parallel -j 8 --colsep='\t' cmd :::: ../fnameinfo.txt
