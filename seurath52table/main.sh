#!/usr/bin/env bash
# vim: set noexpandtab tabstop=2:

#indir=$(mrrdir.sh ../seurath52add_meta)
indir=$(mrrdir.sh ../seurath52UMAP)
outdir=$(mrrdir.sh)

function cmd {
local id=$1
local dir=$2
echo "$id"
local f=$indir/${id}_scvi_MG_reannotated_ABCA4_clustered.rds
if [ -f "$f" ]
then
	slurmtaco.sh -t 2 -n mhgcp-d01 -b -- seurath52table.sh -d "$outdir" -b "${id}_scvi_annotate" -- "$f"&
else
	echo "Error: $f does not exist."
fi
}

source env_parallel.bash
env_parallel -j 8 --colsep='\t' cmd :::: ../fnameinfo_final.txt
