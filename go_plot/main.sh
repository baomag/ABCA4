#!/usr/bin/env bash
# vim: set noexpandtab tabstop=2:

indir=$(mrrdir.sh ../go_analysis)
outdir=$(mrrdir.sh)

function cmd {
local celltype=$1
local f=$indir/${celltype}_go_analysis.rds
local bname=${celltype}_go_plot
if [ -f "$f" ]
then
  echo "$celltype"
	slurmtaco.sh -t 2 -m 20G -n mhgcp-d02 -- scrnaenrichgo2enrichplot.sh -d "$outdir" -- "$f" 
else
	echo "Error: $f does not exist."
fi
}

source env_parallel.bash
env_parallel -j 8 --colsep='\t' cmd :::: input.txt
