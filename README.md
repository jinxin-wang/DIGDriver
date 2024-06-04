# 1. Abstract
# 2. Introduction
# 3. Related Work
# 4. Method
# 5. Experiments
# 6. Analysis
# 7. Conclusion
# 8. Data Description
<details> 
    <summary>8.1 Mappability</summary>
## 
在基因序列分析中，"mappability"（可比性或比对能力）是指一个基因组序列中每个位置被唯一识别和比对的能力。换句话说，mappability描述了某一段序列在基因组中有多大概率能被唯一定位。

### 详细解释

1. **背景**:
   - 在基因组测序和分析过程中，我们通常会从样本中提取大量的短序列读段（reads），然后将这些短序列比对到参考基因组上。这一过程称为"read mapping"（读段比对）。
   - 某些区域的基因组序列可能存在重复或高度相似的序列，这些区域的比对结果可能不唯一或不确定。

2. **mappability的定义**:
   - 对于给定长度的读段，mappability反映了这个读段在整个基因组中能够被唯一比对到参考基因组上的概率。高mappability意味着这个位置上的读段能被准确地唯一比对，而低mappability则意味着读段可能被比对到多个位置或无法唯一比对。

3. **计算方法**:
   - mappability通常通过计算参考基因组的所有可能的k-mer（长度为k的连续子序列）的唯一性来确定。假设k-mer的长度为k（如50bp），我们会扫描整个基因组，看每个位置的k-mer是否在基因组中是唯一的。
   - 如果某个k-mer在基因组中是唯一的，那么该位置的mappability值通常为1（或100%）；如果某个k-mer在基因组中出现多次，该位置的mappability值可能为0（或0%）或更低的值，取决于具体的重复次数和算法。

4. **应用**:
   - **读段比对**：在进行短序列读段比对时，mappability信息可以帮助评估比对结果的可靠性。高mappability区域的比对结果通常更可靠。
   - **变异检测**：在基因组变异检测中，低mappability区域容易产生错误的变异调用，因此在分析中通常需要特别处理或过滤这些区域。
   - **基因表达分析**：在RNA-seq等基因表达分析中，高mappability的区域可以提供更准确的表达定量结果。

### 总结

mappability是基因组分析中一个关键的概念，它帮助研究人员理解和评估序列比对的可靠性。通过识别和处理低mappability区域，研究人员可以提高基因组数据分析的准确性和可信度。
</details> 

<details> 
    <summary>8.2 Roadmap Epigenomics</summary>

**Roadmap Epigenomics**（路线图表观基因组计划）是一个重要的科学项目，旨在绘制人类表观基因组图谱，提供有关表观遗传修饰及其在基因调控和疾病中的作用的深刻见解。以下是该计划的详细解释：

### 背景

表观遗传学研究不涉及DNA序列的改变，而是研究能够影响基因表达和细胞功能的其他可遗传的因素，如DNA甲基化、组蛋白修饰、染色质可及性等。这些表观遗传修饰在细胞分化、发育及疾病发生中起重要作用。

### 目的

Roadmap Epigenomics计划的主要目的是：
1. **绘制人类表观基因组图谱**：在多种正常和疾病状态下，绘制人类基因组的表观遗传修饰图谱。
2. **理解基因调控机制**：揭示表观遗传修饰如何影响基因表达和细胞功能。
3. **推动医学研究**：为研究疾病的表观遗传机制提供基础数据，从而推动疾病诊断、治疗和预防策略的开发。

### 主要研究内容

1. **DNA甲基化**：
   - 通过全基因组甲基化测序，确定基因组中甲基化位点的分布及其在不同细胞类型和疾病状态下的变化。

2. **组蛋白修饰**：
   - 使用染色质免疫沉淀测序（ChIP-seq）技术，绘制不同组蛋白修饰（如H3K4me3, H3K27ac等）在基因组中的分布图谱，了解这些修饰在基因调控中的作用。

3. **染色质可及性**：
   - 利用ATAC-seq和DNase-seq技术，测定染色质的开放区域，揭示基因组中易受转录因子和其他调控蛋白结合的区域。

4. **非编码RNA**：
   - 研究长链非编码RNA（lncRNA）和小RNA（如miRNA）在基因表达调控中的作用，及其在不同细胞类型和疾病中的表达模式。

### 数据和资源

Roadmap Epigenomics项目产生了大量高质量的数据，这些数据通过公开数据库向科学界和公众提供，包括：
- **DNA甲基化数据**：在不同细胞和组织中的全基因组甲基化图谱。
- **组蛋白修饰数据**：涵盖不同细胞类型的组蛋白修饰图谱。
- **染色质可及性数据**：显示染色质开放状态的基因组区域。
- **转录组数据**：不同细胞和组织的RNA测序数据。

这些数据资源为科学家提供了宝贵的信息，用于研究基因调控、细胞分化和疾病机制。

### 成就和影响

- **基因调控网络**：通过对表观基因组数据的分析，研究人员能够构建更全面的基因调控网络，理解基因表达的复杂调控机制。
- **疾病研究**：表观基因组图谱帮助揭示了许多疾病的表观遗传基础，如癌症、神经疾病、免疫疾病等，为开发新的诊断和治疗方法提供了新的线索。
- **个性化医学**：了解表观遗传修饰的个体差异有助于个性化治疗策略的制定，提高治疗效果。

### 总结

Roadmap Epigenomics计划通过系统地绘制表观基因组图谱，推动了我们对基因调控和表观遗传机制的理解。它为基础研究和医学应用提供了丰富的资源，促进了表观遗传学在健康和疾病中的研究和应用。
</details> 

<details> 
    <summary>8.3 Replication Timing</summary>

**Replication Timing**（复制时序）是指在S期过程中，DNA序列在基因组中复制的时间顺序。不同的基因组区域在S期的不同阶段进行复制，这一过程对基因表达调控、基因组稳定性以及细胞功能有着重要影响。以下是关于复制时序的详细解释：

### 基本概念

1. **S期（合成期）**：
   - S期是细胞周期中的一个阶段，在此期间DNA进行复制，确保在细胞分裂时每个子细胞都能获得完整的基因组。

2. **复制时序**：
   - 基因组中的不同区域在S期的不同时间段被复制。某些区域早期复制，称为“早期复制区域”；其他区域晚期复制，称为“晚期复制区域”。

### 复制时序的特征

1. **早期复制**：
   - 通常富含基因且处于活跃转录状态的区域。
   - 多数为开放的染色质结构，易于复制起始复合物的结合。
   - 这些区域在细胞核中往往位于中心或开放的染色质区。

2. **晚期复制**：
   - 通常是基因贫乏或异染色质区域，转录活性低。
   - 这些区域在细胞核中往往位于外围或致密的染色质区。
   - 通常更容易受到复制压力和损伤。

### 复制时序的调控因素

1. **染色质状态**：
   - 开放的染色质状态（如富含组蛋白修饰H3K4me3的区域）更容易早期复制，而异染色质状态（如富含H3K9me3的区域）倾向于晚期复制。

2. **基因表达**：
   - 活跃转录的基因通常在S期早期复制，而沉默基因倾向于晚期复制。

3. **DNA序列特征**：
   - 高GC含量和基因密集的区域倾向于早期复制，反之亦然。

4. **细胞类型特异性**：
   - 不同细胞类型有不同的复制时序图谱，反映了特定细胞类型中不同基因组区域的重要性和功能需求。

### 复制时序的测量

1. **BrdU标记**：
   - 通过将溴脱氧尿嘧啶（BrdU）掺入新合成的DNA中，并利用抗体检测BrdU，可以确定DNA在S期的复制时序。

2. **高通量测序**：
   - 结合BrdU标记和高通量测序技术，可以对整个基因组进行复制时序分析。

3. **Repli-seq（复制测序）**：
   - 通过对S期不同时间点收集的DNA进行测序，生成基因组复制时序图谱。

### 复制时序的生物学意义

1. **基因表达调控**：
   - 复制时序与基因表达密切相关，早期复制区域往往是高表达基因。

2. **基因组稳定性**：
   - 复制时序影响基因组的结构和稳定性，晚期复制区域更易受到复制压力和损伤。

3. **疾病相关性**：
   - 复制时序异常与多种疾病（如癌症）相关，基因组不稳定性和突变频率在这些疾病中更高。

### 总结

复制时序是一个关键的基因组特性，反映了基因组复制的时间和空间动态。通过理解复制时序的调控机制和功能意义，可以揭示基因组功能的复杂调控网络，并为疾病研究提供新的视角。
</details> 

# 9. Usage of source code - [DIGDriver](https://github.com/jinxin-wang/DIGDriver) : 

## scripts:
<details>
    <summary>Data Extractor</summary>

    [example](https://github.com/jinxin-wang/DIGDriver/blob/master/scripts/run_DataExtractor.sh)

    ```
    ## Determine high map regions
    python DataExtractor.py mappability ${mapp} --out-dir ${outdir} --window ${window} ;

    ## Split data window indeces into chunks
    python DataExtractor.py splitDataIdx --base-dir ${basedir} --out-dir ${outdir} --window ${window} --chunk-size ${chunk} --overlap {overlap} --min-map ${minmap};

    ## Build data chunk from saved index
    python DataExtractor.py createChunk ${chunkIdx} --out-dir ${outdir} --ref-file ${ref} --epi-dir ${epi} --mut-file ${bed} --window ${window} --bins ${bins} --save-files ${save} --cancer-key  ${cancer} ;

    ## Add mappability information for each window in an hd5 dataset
    python DataExtractor.py addMappability ${data} ${mapp} ;

    ## Add new track from a bigwig file.\nWARNING: creates a new h5 archive to avoid destructive operations.
    python DataExtractor.py addTracks --h5 ${data} --out-file ${out} --tracks ${tracks}
    ```

</details>

<details>
    <summary>Dig Preprocess</summary>

    ```
    ## usage: DigPreprocess.py 

    Preprocess mutation files for use with DIGDriver.

    positional arguments:
        countGenomeContext          Count the number of occurences of nucleotide contexts in a genome
        addMutationContext          Annotations mutation files with sequence context, add two columns ('MUT_TYPE', 'CONTEXT') in maf file
        addMutationFunction         Annotations mutation file with mutation function
        annotMutationFile           Annotations mutation files with sequence context, do addMutationFunction then addMutationContext
        preprocess_genic_model      pre-count the context counts in the regions that overlap each gene for fast genic pretrained calculation
        preprocess_element_model    pre-count the context counts in the regions that overlap each element region for fast pretrained calculation
        initialize_f_data           Construct a element or sites data file from f_genome_counts, add datasets: substitution_idx, full_window_si_values, full_window_si_index
        preprocess_tiled            preprocess a tiled genome
        
    ```

</details>

<details>
    <summary>Dig Pretrain</summary>

    ```
    ## usage: DigPretrain.py 

    regionModel         Pre-train regional rate parameters from a completed CNN+GP kfold run
    countMutations      Add mutation counts to a pretrained model
    sequenceModel       Pre-train the sequence context parameters using pre-computed genome counts and annotated mutations. 
    countNonc_context   pre-count the context counts in the regions that overlap each noncoding region for fast nonc pretrained calculation
    genicModel          Pre-train the sequence context parameters using pre-computed genome counts and annotated mutations. 
    elementModel        Pre-train the sequence context parameters using pre-computed genome counts and annotated mutations. 
    tiledModel          Pre-train the sequence context parameters using pre-computed genome counts and annotated mutations. 
    ```

</details>

<details>
    <summary>DigDriver</summary>
</details>

<details>
    <summary>mutationFunction</summary>
</details>

## Web-browseable mutation maps
Want to visually explore somatic mutation rates across the genome? Check out our [genome browser](https://resgen.io/maxsh/Cancer_Mutation_Maps/views) genome browser with maps of predicted and observed mutation counts for 37 types of cancer.  

## Getting started
See our [wiki](https://github.com/maxwellsh/DIGDriver/wiki) for installation instructions and tutorials.

## Data files
All necessary data files are available from our [data portal](http://cb.csail.mit.edu/cb/DIG/downloads/)

## Citation
Want to learn more about Dig and its biological applications? Check out our preprint [Sherman et al. 2021](https://www.biorxiv.org/content/10.1101/2021.08.03.454669v1).

Really want to get into the weeds of the deep-learning model? Check out our [ICRL paper](https://openreview.net/forum?id=KtH8W3S_RE).

Please cite both papers if you make use of our resources. 
