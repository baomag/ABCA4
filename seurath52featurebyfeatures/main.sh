#!/usr/bin/env bash
# vim: set noexpandtab tabstop=2:

indir=$(mrrdir.sh ../seurath52int_cluster)
outdir=$(mrrdir.sh)
#f=$indir/ABCA4_int_cluster.rds
#f=$indir/reannotated_int_cluster.rds
f=$indir/scvi_annotated_ABCA4_int_cluster.rds
#f=$(mrrdir.sh ../seurath52split)/ABCA4_int_split.rds
#bname=ABCA4

#slurmtaco.sh -t 2 -m 20G -- seurath52featurebyfeatures.sh -d "$outdir" -b "$bname" -f ABCA4 -s timepoint -- "$f"

function cmd {
local bname=$1
if [ -f "$f" ]
then
	slurmtaco.sh -t 2 -m 20G -n mhgcp-d03 -- seurath52featurebyfeatures.sh -d "$outdir" -b "$bname" -f "$bname" -s sampleid -- "$f"
	#slurmtaco.sh -t 2 -m 20G -n mhgcp-g00 -- seurath52featurebyfeatures.sh -d "$outdir" -b "$bname" -f "$bname" -s timepoint -- "$f"
else
	echo "Error: $f does not exist."
fi
}

source env_parallel.bash
env_parallel -j 8 --colsep='\t' cmd :::: input2.txt
