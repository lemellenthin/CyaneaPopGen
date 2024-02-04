#!/bin/bash

#SBATCH --job-name=novoplasty
#SBATCH --output=novoplasty.txt
#SBATCH --requeue
#SBATCH --time=2-00:00:00
#SBATCH --partition=ycga_bigmem
#SBATCH --nodes=1
#SBATCH --cpus-per-task=32
#SBATCH --mem-per-cpu=10G


module load miniconda

conda activate novoplasty

NOVOPlasty4.3.1.pl -c config.txt

conda deactivate