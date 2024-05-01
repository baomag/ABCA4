#!/usr/bin/env bash
# vim: set noexpandtab tabstop=2:

indir=$(mrrdir.sh ../go_analysis)
outdir=$(mrrdir.sh)

function cmd {
local celltype=$1
local f=$indir/${celltype}_go_analysis.csv
local bname=${celltype}_go_bar_plot
if [ -f "$f" ]
then
  echo "$celltype"
	slurmtaco.sh -t 2 -m 20G -n mhgcp-d03 -- plot_go_bar.sh -b "$bname" -d "$outdir" -c "$celltype" -W 10 -- "$f" 
else
	echo "Error: $f does not exist."
fi
}

source env_parallel.bash
#env_parallel -j 8 --colsep='\t' cmd :::: input.txt
#env_parallel -j 8 --colsep='\t' cmd :::: input_patient.txt
env_parallel -j 8 --colsep='\t' cmd :::: input_specific.txt
