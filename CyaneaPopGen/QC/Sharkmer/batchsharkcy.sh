#!/bin/bash

#SBATCH --job-name=sharkmer
#SBATCH --output=logsharkmer_%j.txt
#SBATCH --time=4-00:00:00
#SBATCH --partition=ycga_bigmem
#SBATCH --nodes=1                    # number of cores and nodes
#SBATCH --cpus-per-task=16           # number of cores
#SBATCH --mem-per-cpu=120G            # shared memory, scaling with CPU request

# For sharkmer, use --partition=ycga_bigmem    --cpus-per-task=16    --mem-per-cpu=60G
# For most other steups, use --partition=pi_dunn   --cpus-per-task=16   --mem-per-cpu=4G

export OMP_NUM_THREADS=$SLURM_CPUS_PER_TASK
module load BEDTools
module load SAMtools
module load BWA
module load miniconda
conda activate shark 


snakemake --cores $SLURM_CPUS_PER_TASK
