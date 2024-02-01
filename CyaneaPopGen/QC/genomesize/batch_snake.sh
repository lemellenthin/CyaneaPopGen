#!/bin/bash

#SBATCH --job-name=genomesize
#SBATCH --output=genomesize_%j.txt
#SBATCH --time=1-00:00:00
#SBATCH --partition=day
#SBATCH --nodes=1                    # number of cores and nodes
#SBATCH --cpus-per-task=18           # number of cores
#SBATCH --mem-per-cpu=5G             # shared memory, scaling with CPU request

module load BEDTools
module load SAMtools
module load BWA
module load miniconda
conda activate snakemake
snakemake --cores $SLURM_CPUS_PER_TASK