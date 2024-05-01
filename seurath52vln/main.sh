#!/usr/bin/env bash
# vim: set noexpandtab tabstop=2:

indir=$(mrrdir.sh ../seurath52normalize)
outdir=$(mrrdir.sh)

function cmd {
local id=$1
local dir=$2
echo "$id"
local f=$indir/${id}_normalized.rds
if [ -f "$f" ]
then
	slurmtaco.sh -t 2 -m 20G -n mhgcp-d02 -- seurath52vln.sh -d "$outdir" -b "${id}_Cone" -f ABCA4 -t Cone -c scpred_prediction -- "$f"
	slurmtaco.sh -t 2 -m 20G -n mhgcp-d02 -- seurath52vln.sh -d "$outdir" -b "${id}_Rod" -f ABCA4 -t Rod -c scpred_prediction -- "$f"
else
	echo "Error: $f does not exist."
fi
}

source env_parallel.bash
env_parallel -j 8 --colsep='\t' cmd :::: ../controlinfo2.txt
#env_parallel -j 8 --colsep='\t' cmd :::: ../fnameinfo.txt
