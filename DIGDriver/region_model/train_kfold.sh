#!/usr/bin/bash

#SBATCH --job-name=digdriver
#SBATCH --nodes=1
#SBATCH --mem=30gb
#SBATCH --time=1:00:00
#SBATCH --cpus-per-task=6
#SBATCH --partition=gpgpuq
#SBATCH --ntasks-per-node=6
#SBATCH --gres=gpu:a100:1
#SBATCH --error=/mnt/beegfs/scratch/j_wang/.tmp/gpu/digdriver.err
#SBATCH --output=/mnt/beegfs/scratch/j_wang/.tmp/gpu/digdriver.output

set -e ;

source ~/.bashrc ;
conda activate RepDigDrive ;


# kfold_mutations_main.py --help
# usage: kfold_mutations_main.py [-h] -c [LABEL_IDS ...] [-d [DATA_FILE]] [-o [OUT_DIR]] [-t [TRACK_FILE]] [-s [SPLIT_METHOD]] [-m [MAPPABILITY]] [-cq [COUNT_QUANTILE]] [-a] [-gp [RUN_GAUSSIAN]]
#                                [-as [AUTOREGRESSIVE_SIZE]] [-k [K]] [-gr [GP_RERUNS]] [-gd [GP_DELTA]] [-re [NN_RERUNS]] [-mr [MAX_NN_RERUNS]] [-vr [VAL_RATIO]] [-e [EPOCHS]] [-b [BS]] [-nd [N_INDUCING]]
#                                [-nt [N_ITER]] [-sm] [-st] [-g [GPUS]] [-u]

# options:
#   -h, --help            show this help message and exit
#   -c [LABEL_IDS ...], --cancer-id [LABEL_IDS ...]
#                         A list of the h5 file mutation count dataset IDs (e.g. SNV_skin_melanoma_MELAU_AU)
cancer='Biliary-AdenoCA'

#   -d [DATA_FILE], --data [DATA_FILE]
#                         Path to h5 data file
data='/mnt/beegfs/scratch/j_wang/03_Results/Dig/h5/002_split_data_10000_0_0.8.h5'

#   -o [OUT_DIR], --out-dir [OUT_DIR]
#                         Path to output directory
outdir='/mnt/beegfs/scratch/j_wang/03_Results/Dig/h5'

#   -t [TRACK_FILE], --tracks [TRACK_FILE]
#                         Path to predictor tracks selection file
#   -s [SPLIT_METHOD], --split [SPLIT_METHOD]
#                         Dataset split method (random/chr)
#   -m [MAPPABILITY], --mappability [MAPPABILITY]
#                         Mappability lower bound
#   -cq [COUNT_QUANTILE], --count-quantile [COUNT_QUANTILE]
#                         Region mutation count quanitle threshold.
#   -a, --attention       True: train with attention map training and save attention maps
#   -gp [RUN_GAUSSIAN], --gaussian [RUN_GAUSSIAN]
#                         True: train gaussian process regression on the best performing model
#   -as [AUTOREGRESSIVE_SIZE], --autoregressive-size [AUTOREGRESSIVE_SIZE]
#                         number of neighbouring regions for autoregressive features
#   -k [K]                Number of folds
#   -gr [GP_RERUNS], --gp-reruns [GP_RERUNS]
#                         GP maximum reinitializations for convergence
#   -gd [GP_DELTA], --gp-delta [GP_DELTA]
#                         Maximum difference between a fold NN and GP scores
#   -re [NN_RERUNS], --nn-reruns [NN_RERUNS]
#                         Number of model reinitializations and training runs
#   -mr [MAX_NN_RERUNS], --max-nn-reruns [MAX_NN_RERUNS]
#                         NN maximum reinitializations for GP to successeed
#   -vr [VAL_RATIO], --val-ratio [VAL_RATIO]
#                         Validation set split size ratio
#   -e [EPOCHS], --epochs [EPOCHS]
#                         Number of epochs
#   -b [BS], --batch [BS]
#                         Batch size
#   -nd [N_INDUCING], --n-inducing [N_INDUCING]
#                         Number of GP inducing points
#   -nt [N_ITER], --n-iter [N_ITER]
#                         Number of GP iterations
#   -sm, --save-model     True: save best model across all reruns
#   -st, --save-training  True: save training process and results to Tensorboard file
#   -g [GPUS], --gpus [GPUS]
#                         GPUs devices (all/comma separted list)
gpus='0'

#   -u, --sub_mapp        True: run model on regions below mappability threshold

python kfold_mutations_main.py -c ${cancer} -d ${data} -o ${outdir} -g ${gpus} ; 