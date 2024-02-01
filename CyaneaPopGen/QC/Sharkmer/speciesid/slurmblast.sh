#!/bin/bash
#SBATCH --job-name=blast_search       # Job name
#SBATCH --output=blast_search.out    # Output file for standard output
#SBATCH --error=blast_search.err      # Output file for standard error
#SBATCH --partition=ycga   # Specify the partition or queue name
#SBATCH --nodes=1                    # Number of nodes
#SBATCH --cpus-per-task=16          # Number of tasks (CPU cores) per node
#SBATCH --mem-per-cpu=10G               # Memory per node (adjust as needed)
#SBATCH --time=1-00:00:00


# Load necessary modules (if required)
# module load blast
module load miniconda

# Activate your Conda environment (if needed)
conda activate my_blast_env

# Change to your working directory
cd /home/lem79/project/CyaneaPopGen/analyses_sharkmer/speciesid/output/CyaneaFulvaLMD324_pcr/

# Run the BLAST command
blastn -query CyaneaFulvaLMD324_28s.fasta -db nt -remote -out cyful324_28.txt -evalue 1e-7
blastn -query CyaneaFulvaLMD324_18s.fasta -db nt -remote -out cyful324_18.txt -evalue 1e-7

cd /home/lem79/project/CyaneaPopGen/analyses_sharkmer/speciesid/output/CyaneaFulvaLEM1_pcr/

blastn -query CyaneaCapillataLEM1_28s.fasta -db nt -remote -out cycap1_28.txt -evalue 1e-5
blastn -query CyaneaCapillataLEM1_18s.fasta -db nt -remote -out cycap1_18.txt -evalue 1e-5

# Deactivate Conda environment (if activated)
conda deactivate

# Job completion message
echo "BLAST search completed on $(date)"
