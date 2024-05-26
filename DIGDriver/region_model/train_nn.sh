#!/bin/bash

set -e ;

source ~/.bashrc ;
conda activate RepDigDrive ;

## This is an **example** command to fit neural network predictions for 10kb regions of the PCAWG pan-cancer cohort.
## 
## NOTE: THE PROCESS REQUIRES INPUT DATA TOO LARGE TO BE INCLUDED IN THIS GITHUB REPO.
##       CONTACT THE AUTHORS TO ENSURE YOU HAVE THE NECESSARY INPUT FILES AND COMPUTE RESROUCES
##       IF YOU WANT TO CREATE MUTATION RATE MAPS FROM YOUR OWN WGS DATASETS.

# '-c', '--cancer-id', required=True, nargs='*', action='store', type=str, dest='label_ids',
#          help='A list of the h5 file mutation count dataset IDs (e.g. SNV_skin_melanoma_MELAU_AU). Best model is selected based on first cohort in the list. ')
cancer='Biliary-AdenoCA'

# Path arguments
#   '-d', "--data", required=False, nargs='?', action='store', type=str, dest='data_file',
#          default='/storage/datasets/cancer/unzipped_data_matrices_pcawg_50k.h5', help='Path to h5 data file')
data='/mnt/beegfs/scratch/j_wang/03_Results/Dig/h5/002_split_data_10000_0_0.8.h5'

#   '-o', "--out-dir", required=False, nargs='?', action='store', type=str, dest='out_dir',
#          default='/storage/yaari/mutation-density-outputs', help='Path to output directory')
outdir='/mnt/beegfs/scratch/j_wang/03_Results/Dig/h5'

#   '-u', "--held-out", required=False, nargs='?', action='store', type=str, dest='heldout_file',
#          default=None, help='Path to file of held-out samples file')

#   '-t', "--tracks", required=False, nargs='?', action='store', type=str, dest='track_file',
#          default=None, help='Path to predictor tracks selection file')

# python mutations_main.py -c Pancan_SNV


python mutations_main.py -c ${cancer} -d ${data} -o ${outdir} ; 