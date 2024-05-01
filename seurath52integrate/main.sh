#!/usr/bin/env bash
# vim: set noexpandtab tabstop=2:

outdir=$(mrrdir.sh)
indir=$(mrrdir.sh ../seurath52add_meta)
files=("$indir"/*_add_meta.rds)
#bname=integrate
bname=reannotated

#slurmtaco.sh -t 4 -m 80 -p short -n mhgcp-d02 -- seurath52integrate.sh -t 10 -d "$outdir" -b "$bname" -- "${files[@]}"
slurmtaco.sh -t 4 -n mhgcp-d02 -- seurath52integrate.sh -t 10 -d "$outdir" -b "$bname" -- "${files[@]}"
