#!/usr/bin/env bash
# vim: set noexpandtab tabstop=2:

#!/bin/bash
#SBATCH --job-name=gpu_job           # Job name
#SBATCH --output=gpu_job_%j.out      # Output file name (%j expands to jobID)
#SBATCH --error=gpu_job_%j.err       # Error file name (%j expands to jobID)
#SBATCH --partition=gpu               # Use the GPU partition
#SBATCH --gres=gpu:0                  # Request 1 GPU
#SBATCH --nodes=1                     # Number of nodes
#SBATCH --ntasks-per-node=1           # Number of tasks (MPI processes) per node
#SBATCH --cpus-per-task=1             # Number of CPU cores per task
#SBATCH --mem=16GB                    # Memory per node
#SBATCH --time=300:00:00                # Maximum runtime in HH:MM:SS
#SBATCH --nodelist=mhgcp-g00

slurmtaco.sh -n mhgcp-g01 -- python /storage/chen/home/u244209/wrapper/src/scVI_annotation/python/scVI_annotation_new.py
#python /storage/chen/home/u244209/wrapper/src/scVI_annotation/python/scVI_annotation_new.py

