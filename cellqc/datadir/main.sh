#!/usr/bin/env bash
# vim: set noexpandtab tabstop=2:

source trapdebug
outdir=$(mrrdir.sh)

function cmd {
local id=$1
local dir=$2
local sampledir=$outdir/$id
mkdir -p "$sampledir"
ln -s "$dir"/* "$sampledir"
}

source env_parallel.bash
env_parallel --colseq='\t' cmd < <(tail -n +2 ../samples.txt)
