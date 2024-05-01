#!/usr/bin/env bash
# vim: set noexpandtab tabstop=2:

#indir=$(mrrdir.sh ../cellqc/scpred/)
#indir=$(mrrdir.sh ../cellqc/owen/result/)
#indir=$(mrrdir.sh ../cellqc/multi/result/)
indir=$(mrrdir.sh ../cellqc/tomreh)
outdir=$(mrrdir.sh)

function cmd {
local id=$1
local dir=$2
echo "$id"
local f=$indir/${id}.h5seurat
if [ -f "$f" ]
then
	slurmtaco.sh -t 2 -m 20G -n mhgcp-d02 -- seurath52normalize.sh -d "$outdir" -b "$id" -- "$f"
else
	echo "Error: $f does not exist."
fi
}

source env_parallel.bash
#env_parallel -j 8 --colsep='\t' cmd :::: ../fnameinfo_final.txt
#env_parallel -j 8 --colsep='\t' cmd :::: ../fnameinfo_owen.txt
#env_parallel -j 8 --colsep='\t' cmd :::: ../fnameinfo_multi.txt
env_parallel -j 8 --colsep='\t' cmd :::: ../fnameinfo_tomreh.txt
