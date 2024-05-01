#!/usr/bin/env bash
# vim: set noexpandtab tabstop=2:

indir=$(mrrdir.sh ../DEGs_diff)
outdir=$(mrrdir.sh)

function cmd {
local celltype=$1
#local f=$indir/treatment_${celltype}_DEGs.txt
local f=$indir/${celltype}_DEG.txt
local bname=${celltype}_go_analysis
if [ -f "$f" ]
then
  echo "$celltype"
	slurmtaco.sh -t 2 -m 20G -n mhgcp-d02 -- enrichgobygeneset.sh -o "$outdir/$bname.txt.gz" -- "$f"
else
	echo "Error: $f does not exist."
fi
}

source env_parallel.bash
env_parallel -j 8 --colsep='\t' cmd :::: input2.txt
