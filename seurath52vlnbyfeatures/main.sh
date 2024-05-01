#!/usr/bin/env bash
# vim: set noexpandtab tabstop=2:

outdir=$(mrrdir.sh)
#f=$(mrrdir.sh ../seurath52int_cluster)/scvi_annotated_ABCA4_int_cluster.rds
#bname=scvi_annotated_ABCA4
#f=$(mrrdir.sh ../seurath52merge/seuratmerge_merged.rds)
#bname=merged_data
#f=$(mrrdir.sh ../seurath52UMAP)/scvi_annotated_ABCA4_RPC_clustered.rds
f=$(mrrdir.sh ../seurath52int_cluster)/scvi_annotated_ABCA4_int_cluster.rds
bname=scvi_annotated_int_ABCA4

#slurmtaco.sh -t 2 -m 20G -n mhgcp-d01 -- seurath52vlnbyfeatures.sh -d "$outdir" -b "${bname}_Cone" -f ABCA4 -g sampleid -t Cone -c celltype -- "$f"
#slurmtaco.sh -t 2 -m 20G -n mhgcp-d01 -- seurath52vlnbyfeatures.sh -d "$outdir" -b "${bname}_Rod" -f ABCA4 -g sampleid -t Rod -c celltype -- "$f"
slurmtaco.sh -t 2 -m 20G -n mhgcp-d01 -- seurath52vlnbyfeatures.sh -d "$outdir" -b "${bname}_PRPC_SLC1A3" -f SLC1A3 -g seurat_clusters -t PRPC -c celltype -- "$f"
slurmtaco.sh -t 2 -m 20G -n mhgcp-d01 -- seurath52vlnbyfeatures.sh -d "$outdir" -b "${bname}_NRPC_SLC1A3" -f SLC1A3 -g seurat_clusters -t NRPC -c celltype -- "$f"
slurmtaco.sh -t 2 -m 20G -n mhgcp-d01 -- seurath52vlnbyfeatures.sh -d "$outdir" -b "${bname}_PRPC_CRYM" -f CRYM -g seurat_clusters -t PRPC -c celltype -- "$f"
slurmtaco.sh -t 2 -m 20G -n mhgcp-d01 -- seurath52vlnbyfeatures.sh -d "$outdir" -b "${bname}_NRPC_CRYM" -f CRYM -g seurat_clusters -t NRPC -c celltype -- "$f"
slurmtaco.sh -t 2 -m 20G -n mhgcp-d01 -- seurath52vlnbyfeatures.sh -d "$outdir" -b "${bname}_PRPC_RLBP1" -f RLBP1 -g seurat_clusters -t PRPC -c celltype -- "$f"
slurmtaco.sh -t 2 -m 20G -n mhgcp-d01 -- seurath52vlnbyfeatures.sh -d "$outdir" -b "${bname}_NRPC_RLBP1" -f RLBP1 -g seurat_clusters -t NRPC -c celltype -- "$f"
