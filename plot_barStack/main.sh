#!/usr/bin/env bash
# vim: set noexpandtab tabstop=2:

outdir=$(mrrdir.sh)
f=../scvi_annotate_cellprop.txt

slurmtaco.sh -t 2 -n mhgcp-d02 -b -- plot_barStack.sh -d "$outdir" -b scvi_annotated_cell_proportion -- "$f"&

