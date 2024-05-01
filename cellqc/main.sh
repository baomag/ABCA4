#!/usr/bin/env bash
# vim: set noexpandtab tabstop=2:

set -x
outdir=$(mrrdir.sh)
slurmtaco.sh -x mhgcp-g00 -m 40G -- cellqc -c config.yaml -d "$outdir"
