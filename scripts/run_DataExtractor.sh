#!/usr/bin/bash

#SBATCH --cpus-per-task=4 
#SBATCH --mem=10G 
#SBATCH --time=7-00:00:00 
#SBATCH --partition longq

set -e ;

source ~/.bashrc
conda activate RepDigDrive 

# 'mappability', help='Determine high map regions'
mapp='/mnt/beegfs/userdata/j_wang/Algorithm_Resources/dig/Mappability/wgEncodeCrgMapabilityAlign36mer.bigWig'
# 'map_file', type=str, help='path to mappability file'
# '--out-dir', type=str, default='.', help='Output directory relative to base-dir'
outdir='/mnt/beegfs/scratch/j_wang/03_Results/Dig/h5/window100'
# '--window', type=int, default=10000, help='window size for mappability'
window='100'
# '--overlap', type=int, default=0, help='base pairs of overlap for contiguous windows'
overlap='0'
# '--min-map', type=float, default=0.80, help='minimum mappability for window'
mkdir -p ${outdir} ; 
python DataExtractor.py mappability ${mapp} --out-dir ${outdir} --window ${window} ;

# 'splitDataIdx', help='Split data window indeces into chunks'
# '--base-dir', type=str, default='.', help='Directory of mappability file'
basedir='/mnt/beegfs/scratch/j_wang/03_Results/Dig/h5/window100/'
# '--out-dir', type=str, default='sorted_data', help='Output directory relative'
outdir='/mnt/beegfs/scratch/j_wang/03_Results/Dig/h5/window100/'
# '--chunk-size', type=int, default=10000, help='chunk size for data'
chunk='10000'
# '--window', type=int, default=10000, help='window size for mappability'
# window='100'
# '--overlap', type=int, default=0, help='base pairs of overlap for contiguous windows'
overlap='0'
# '--min-map', type=float, default=0.80, help='minimum mappability for window'
minmap='0.80'
# '--shuffle', action='store_true', default=False, help='randomly shuffle data indeces'
shuffle='False'

python DataExtractor.py splitDataIdx --base-dir ${basedir} --out-dir ${outdir} --window ${window} ;

# 'createChunk', help='Build data chunk from saved index'
# '--chunkIdx', help='path to indeces for chunk windows relative to base-dir'
chunkIdx='/mnt/beegfs/scratch/j_wang/03_Results/Dig/h5/window100/002_data_indices_100_0_0.8.pkl'
# '--base-dir', type=str, default='.', help='base directory of analysis'
# basedir='/mnt/beegfs/userdata/j_wang/Algorithm_Resources/dig/'
# '--out-dir', type=str, default='sorted_data', help='Output directory relative to base-dir'
outdir='/mnt/beegfs/scratch/j_wang/03_Results/Dig/h5/window100/'
# '--ref-file', type=str, default=None, help='path to ref genome relative to base-dir'
ref='/mnt/beegfs/userdata/j_wang/Algorithm_Resources/dig/downloads/dig_data_files/hg19.fasta'
# '--epi-dir', type=str, default='epigenomes/raw', help='path to epigenomes dir relative to base-dir'
epi='/mnt/beegfs/userdata/j_wang/Algorithm_Resources/dig/Epigenomics/E012-H3K27ac.pval.signal.bigwig'
# '--mut-file', type=str, default=None, help='path to file of mutations for a particular cancer'
mut='/mnt/beegfs/userdata/j_wang/Algorithm_Resources/dig/downloads/mutation_files/PCAWG/ICGC_only/Biliary-AdenoCA_SNV_MNV_INDEL.ICGC.annot.txt.gz'
bed='/mnt/beegfs/userdata/j_wang/Algorithm_Resources/dig/downloads/mutation_files/PCAWG/ICGC_only/Biliary-AdenoCA_SNV_MNV_INDEL.ICGC.annot.bed.gz'
# '--repli-dir', type=str, default='replication_timing/', help='path to replication time dir relative to base-dir'
# repli='Replication_Timing/'
# '--window', type=int, default=10000, help='window size for mappability'
# window='100'
# '--bins', type=int, default=-1, help='bins to use for coarsegraining'
bins='-1'
# '--save-files', type=str, default='True', help='save file of track extraction'
save='True'
# '--cancer-key', type=str, dest='cancer_key', help='key for saving cancer mut targets'
cancer='Biliary-AdenoCA'

# ln -s ${mut} ${bed};
# tabix -f -p bed ${bed};
python DataExtractor.py createChunk ${chunkIdx} '--out-dir' ${outdir} '--ref-file' ${ref} '--epi-dir' ${epi} '--mut-file' ${bed} '--window' ${window} '--bins' ${bins} '--save-files' ${save} '--cancer-key'  ${cancer} ;

# 'addMappability', help='add mappability information for each window in an hd5 dataset.')
#     'h5_file',  help='path to h5 file')
data='/mnt/beegfs/scratch/j_wang/03_Results/Dig/h5/window100/002_split_data_100_0_0.8.h5'
#     'map_file', help='path to mappability file')
mapp='/mnt/beegfs/userdata/j_wang/Algorithm_Resources/dig/Mappability/wgEncodeCrgMapabilityAlign36mer.bigWig'

# parser_h.set_defaults(func=add_mappability)

python DataExtractor.py addMappability ${data} ${mapp} ;

# ## Add tracks
# 'addTracks', help='Add new track from a bigwig file.\nWARNING: creates a new h5 archive to avoid destructive operations.')
# parser_i.add_argument('--h5', required=True, help='path to h5 containing data to be augmented')
data='/mnt/beegfs/scratch/j_wang/03_Results/Dig/h5/window100/002_split_data_100_0_0.8.h5'
# parser_i.add_argument('--tracks', type=str, nargs="+", default=[], help='Track(s) to add as a space separated list')
tracks='/mnt/beegfs/userdata/j_wang/Algorithm_Resources/dig/Epigenomics/E025-H3K27me3.pval.signal.bigwig /mnt/beegfs/userdata/j_wang/Algorithm_Resources/dig/Epigenomics/E012-H3K9me3.pval.signal.bigwig /mnt/beegfs/userdata/j_wang/Algorithm_Resources/dig/Epigenomics/E001-H3K4me3.pval.signal.bigwig'
# parser_i.add_argument('--track-file', type=str, default="", help='File of tracks to add, one per line. Supersedes --tracks.')
# parser_i.add_argument('--inplace', default=False, action='store_true', help='Add tracks to the existing h5 archive. WARNING: may not always be possible; if you get an error, don\'t run without this flag.')
inplace='False'
# parser_i.add_argument('--out-file', type=str, help='output file name if not altering in place')
out='/mnt/beegfs/scratch/j_wang/03_Results/Dig/h5/window100/002_split_data_100_0_0.8_add_tracks.h5'
# parser_i.add_argument('--compress', default=False, action='store_true', help='Compress the archive if not altering in place?')
# parser_i.add_argument('--remove_old', action="store_true", default='False', help='Remove original h5 archive if not altering in place?')

python DataExtractor.py addTracks --h5 ${data} --out-file ${out} --tracks ${tracks} ;

