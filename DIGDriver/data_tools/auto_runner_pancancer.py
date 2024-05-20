import DIG_auto
import sys
import traceback

# cancers =['Head-SCC_SNV', 'Adenocarcinoma_tumors_SNV_msi_low','Liver-HCC_SNV', 'Biliary-AdenoCA_SNV',
# 'Bladder-TCC_SNV', 'Lung-SCC_SNV', 'Bone-Osteosarc_SNV', 'Lung_tumors_SNV','Breast-AdenoCa_SNV', 
# 'Ovary-AdenoCA_SNV','Carcinoma_tumors_SNV_msi_low','Panc-AdenoCA_SNV',
# 'CNS-GBM_SNV', 'Pancan_SNV', 'CNS_tumors_SNV','Prost-AdenoCA_SNV',
# 'ColoRect-AdenoCA_SNV',	'Sarcoma_tumors_SNV','ColoRect-AdenoCA_SNV_msi_low', 'Skin-Melanoma_SNV',
# 'Digestive_tract_tumors_SNV','Squamous_tumors_SNV','Digestive_tract_tumors_SNV_msi_low', 'Thy-AdenoCA_SNV',
# 'Eso-AdenoCa_SNV', 'Uterus-AdenoCA_SNV','Female_reproductive_system_tumors_SNV_msi_low','Uterus-AdenoCA_SNV_msi_low']


# ## required
# parser_a.add_argument('--out-dir', type=str, dest='out_dir', required = True, help='Base Directory of DIG run. All intermediate files will be saved relative to this location')
# parser_a.add_argument('--map-ref', type=str, dest='map_ref', help='path to mappability file')
# parser_a.add_argument('--window-size', type=int, default=10000, dest='window', help='desired window size for DIG model regions')
# parser_a.add_argument('--min-map', type=float, default=0.50, dest='min_mapp', help='minimum mappability for windows')
# parser_a.add_argument('--ref-file', type=str, dest='ref_file', help='path to reference hg19 genome')
# parser_a.add_argument('--mut-file', type=str, dest='mut_file', required = True, help='path to mutations file')
# parser_a.add_argument('--N-procs', type = int, dest='n_procs', default = 20, help= 'number of processes to run')

# ## partial runs
# parser_a.add_argument('--map-file', type = str, dest = 'map_file', help = 'map to precomputed mappability file')
# parser_a.add_argument('--epi-dir', type=str, dest='epi_dir', help='path to epigenomics files')
# parser_a.add_argument('--split_idx', type=str, dest='split_dir', help='path to split index dir')
# parser_a.add_argument('--epi-matrix_dir', type=str, dest='epi_matrix_dir', help='path to constructed epigenome matrix h5 file')
# parser_a.add_argument('--fmodel-dir', type=str, dest='fmodel_dir', help='path to constructed genome context frequency file')
# parser_a.add_argument('--gp-results-base', type=str, dest='gp_res', help='path to generic file name of gp results fold')

# ##optional arguments
# parser_a.add_argument('-c', '--cancer-key', type = str, dest = 'cancer_key', help = 'key name for cancer targets')
# parser_a.add_argument('-g', "--gpus", required=False, nargs='?', action='store', type=str, dest='gpus',
#                 default='all', help='GPUs devices (all/comma separted list)')

try:
    # fmut_str = '/data/cb/maxas/data/projects/cancer_mutations/cancer_mutations_PCAWG/DIG_FILES/' + c + '.annot.txt.gz'
    # gp_str   = '/scratch2/dig/full_pcawg/' + c + '/gp_results_fold_{}.h5'.format('10kb')
    
    out_dir = "--out-dir /mnt/beegfs/scratch/j_wang/03_Results/Dig/Results/Pancan_10k " # Base Directory of DIG run. All intermediate files will be saved relative to this location
    map_ref = '--map-ref /mnt/beegfs/userdata/j_wang/Algorithm_Resources/dig/Mappability/wgEncodeCrgMapabilityAlign36mer.bigWig ' # path to mappability file
    win_size= '--window-size 10000' # desired window size for DIG model regions
    min_map = '--min-map 0.7' # minimum mappability for windows
    ref_file= '--ref-file /mnt/beegfs/userdata/j_wang/Algorithm_Resources/dig/downloads/dig_data_files/hg19.fasta ' # path to reference hg19 genome
    mut_file= '--mut-file /mnt/beegfs/userdata/j_wang/Algorithm_Resources/dig/downloads/mutation_files/PCAWG/ICGC_only/Pancan_SNV_MNV_INDEL.ICGC.annot.txt.gz ' # path to mutations file
    num_proc= '--N-procs 20 ' # number of processes to run

    # map_file= '--map-file' # map to precomputed mappability file
    epi_dir = '--epi-dir /mnt/beegfs/userdata/j_wang/Algorithm_Resources/dig/Epigenomics '
    # splt_idx= '--split_idx'
    # epi_dir = '--epi-matrix_dir'
    # fmd_dir = '--fmodel-dir'
    gp_res  = '--gp-results-base /mnt/beegfs/scratch/j_wang/03_Results/Dig/Results/Pancan_10k/gp_results_fold_10kb.h5 '

    cc_key  = '--cancer-key Pancan_SNV'
    # gpus    = "--gpus"

    # dig_args = DIG_auto.parse_args('runDIG --out-dir {} --window-size {} --min-map {} --ref-file {} --mut-file {} --N-procs {} --map-file {} --fmodel-dir {} --gp-results-base {} -c {}'.format(
    #     '/scratch1/priebeo/PCAWG_full_results/v1_final_results'
    #     , 10000
    #     , 0.5
    #     , '/scratch1/maxas/ICGC_Roadmap/reference_genome/hg19.fasta'
    #     , fmut_str
    #     , 30
    #     , '/scratch1/priebeo/neurIPS/10kb_map_0'
    #     , '/scratch1/priebeo/PCAWG_full_results/v1_final_results/fmodel_10000_trinuc_192.h5'
    #     , gp_str
    #     , c
    #     ))
    
    dig_args = DIG_auto.parse_args(
        f"runDIG {out_dir} {map_ref} {win_size} {min_map} {ref_file} {mut_file} {num_proc} {epi_dir} "
    )

    DIG_auto.run(dig_args)
except:
    print("Unexpected error:")
    traceback.print_exc()
    print('failed' + c)
    print('skipping...')
