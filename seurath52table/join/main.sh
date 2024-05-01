#!/usr/bin/env bash
# vim: set noexpandtab tabstop=2:

indir=$(mrrdir.sh ..)
#files=("$indir"/*.txt)
sampleids=(
10x3v31_Organoid_JONR1_D135
10x3v31_Organoid_JONR_D262
10x3v31_Organoid_SONR1_D135
10x3v31_Organoid_SONR_D262
NHDF2_D130
NHDF2_D320
)
#files=($(newlines.sh -- "${sampleids[@]}" | pendlines.sh -p "$indir"/ -s _scvi_annotate_cell_prop.txt))
files=($(newlines.sh -- "${sampleids[@]}" | pendlines.sh -p "$indir"/ -s _scvi_annotate_cell_count.txt))
#bname=($(basename.sh -s _scvi_annotate_cell_prop.txt -- "${files[@]}" | sed "s/10x3v31_Organoid_//g"))
bname=($(basename.sh -s _scvi_annotate_cell_count.txt -- "${files[@]}" | sed "s/10x3v31_Organoid_//g"))
outdir=$(mrrdir.sh)

#(
#	strjoin.sh celltype "${bname[@]}"
#	jouterjoinm.sh -S -N 0 -c 'tail -n +2 < {}' -- "${files[@]}"
#) | tofile.sh -o "$outdir/scvi_annotate_cellprop.txt.gz"

(
	strjoin.sh celltype "${bname[@]}"
	jouterjoinm.sh -S -N 0 -c 'tail -n +2 < {}' -- "${files[@]}"
) | tofile.sh -o "$outdir/scvi_annotate_cellcount.txt.gz"
