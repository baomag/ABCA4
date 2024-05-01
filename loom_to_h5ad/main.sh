#!/usr/bin/env bash

f=/storage/chen/home/u244209/ABCA4/looms_merge/tomreh_combined.loom
bname=tomreh_combined
outdir=$(mrrdir.sh)

slurmtaco.sh -n d02 -- loom_to_h5ad -d "$outdir" -b "$bname" -e scvi-env -t 2 -- "$f"
