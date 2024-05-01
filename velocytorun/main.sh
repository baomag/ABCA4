#!/usr/bin/env bash

# set -x
outdir=$(mrrdir.sh)
#barcode=/storage/singlecell/jeanl/organoid/data/D45_organoid_Sridhar/D45_organoid/outs/filtered_feature_bc_matrix/barcodes.tsv.gz
#bam=/storage/singlecell/jeanl/organoid/data/D45_organoid_Sridhar/D45_organoid/outs/possorted_genome_bam.bam
genome=/storage/singlecell/zz4/Reference/refdata-cellranger-arc-GRCh38-2020-A/genes/genes.gtf

function cmd {
local bname=$1
local barcode=$2
local bam=$3
if [ -f "$bam" ]
then
	export TMPDIR=$outdir
	slurmtaco.sh -n g00 -- velocytorun -e velocyto -d "$outdir" -b "$bname" -c "$barcode" -g "$genome" -t 8 -- "$bam"
else
	echo "Error: $bam does not exist."
fi
}

source env_parallel.bash
env_parallel -j 8 --colsep='\t' cmd :::: meta.csv
