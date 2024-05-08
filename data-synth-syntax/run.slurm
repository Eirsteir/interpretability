#!/bin/sh
#SBATCH --partition=GPUQ
#SBATCH --account=ie-idi
#SBATCH --time=20:00:00
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --cpus-per-task=8
#SBATCH --mem=64G
#SBATCH --job-name="data-synth-syntax-preprocess"
#SBATCH --output=outputs/training.out
#SBATCH --mail-user=eirsteir@stud.ntnu.no
#SBATCH --mail-type=ALL

cd ${SLURM_SUBMIT_DIR}

module purge
module load Python/3.11.5-GCCcore-13.2.0

python -m pip install --upgrade pip

pip install virtualenv
virtualenv env
source env/bin/activate

pip install -r requirements.txt

echo "Running Preprocessing"

srun python preprocess_data.py
