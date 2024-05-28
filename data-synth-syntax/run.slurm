#!/bin/sh
#SBATCH --partition=CPUQ
#SBATCH --account=ie-idi
#SBATCH --time=60:00:00
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --cpus-per-task=8
#SBATCH --mem=50G
#SBATCH --job-name="data-synth-syntax-preprocess"
#SBATCH --output=outputs/training.out
#SBATCH --mail-user=eirsteir@stud.ntnu.no
#SBATCH --mail-type=ALL

cd ${SLURM_SUBMIT_DIR}

module purge
module load Python/3.9.6-GCCcore-11.2.0

python -m pip install --upgrade pip

pip install virtualenv
virtualenv env
source env/bin/activate

pip install -r requirements.txt

pip install pydantic~=1.10

echo "Running Preprocessing"

srun python preprocess_data.py
