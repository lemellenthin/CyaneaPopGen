#!/bin/bash
#SBATCH --job-name=cyaneapopgen
#SBATCH --output=cyaneapopgen_%j.log
#SBATCH --requeue
#SBATCH --time=2-00:00:00
#SBATCH --partition=ycga_bigmem
#SBATCH --nodes=2                    # number of cores and nodes
#SBATCH --cpus-per-task=32           # number of cores
#SBATCH --mem-per-cpu=10G             # shared memory, scaling with CPU request

# Set up modules
# module --force purge # Unload any existing modules that might conflict
# module load ruamel.yaml
# module load Java
# module load Trimmomatic
# module load GATK
module load BEDTools
module load SAMtools
# module load picard
# module load BCFtools
# module load VCFtools
module load miniconda
module load BWA
# module load FastQC
module list

conda activate snakemake

snakemake --scheduler greedy --verbose --rerun-incomplete --cores $SLURM_CPUS_PER_TASK --latency-wait 60