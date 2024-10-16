# Sensitive Red Fluorescent Calcium Indicators for Multi-Modality Imaging of Neuronal Populations In Vivo

**Authors**:  
Shihao Zhou, Qiyu Zhu, Minho Eom, Shilin Fang, Oksana M. Subach, Yangdong Wang, Jiewen Hu, Hanbin Zhang, Zhiyuan Wang, Xiaoting Sun, Yu Mu, Young-Gyu Yoon, Zengcai V. Guo, Fedor V. Subach, Kiryl D. Piatkevich

---

## Software Dependencies

* **2-Photon Imaging Analysis**:
  - Python 3.10
  - suite2p
  - Matlab 2023b 
* **2-Photon Imaging Analysis (CNMF Analysis)**:  
  - Ubuntu 18.04  
  - Python 3.10  
  - CaImAn 1.10
* **1-Photon Imaging Analysis**:  
  - Ubuntu 18.04  
  - Matlab 2023b  
  - CNMF-E library 1.1.2
* **Zebrafish and Neuronal Culture Analysis**:
  - Matlab 2023b
  - ImageJ2

---

## Installation Guide

### 2-Photon Imaging Analysis

1. **Install suite2p:**
Download suite2p and prepare the environment from:https://github.com/MouseLand/suite2p.
This process usually takes less than an hour on a standard desktop.

### 2-Photon Imaging Analysis (CNMF Analysis)

1. **Create Conda environment**:  
   ```bash
   conda create --name my_env python=3.10
   ```
2. **Activate Conda environment**:  
   ```bash
   conda activate my_env
   ```
3. Install CNMF library:
   ```bash
   conda install -n base -c conda-forge mamba
   mamba create -n caiman -c conda-forge caiman
   conda activate caiman
   ```

The installation typically takes around 30 minutes on a standard desktop.

### 1-Photon Imaging Analysis
1. **Install Matlab 2023b:**
Download and install Matlab 2023b from the official website. This process usually takes less than an hour on a standard desktop.

### Zebrafish and Neuronal Culture Analysis
1. **Install Matlab 2023b:**
Download and install Matlab 2023b from the official website. This process usually takes less than an hour on a standard desktop.
2. **Install ImageJ2:**
Download and install ImageJ2 (Fiji) from the official website. This process usually takes less than an ten minutes on a standard desktop.

---

## 2-Photon Imaging Analysis

### Scripts:
- **`demo_grating_visual_analysis.m`**:  
  Pipeline for analyzing neuronal activity kinetics during grating visual stimulation in 2-photon imaging.

- **`calculate_peakdFF_snr_halfdecay.m`**:  
  Function to calculate peak ΔF/F₀, peak signal-to-noise ratio (SNR), and half-decay time.

- **`find_stimulus_evoked_neurons_bintrial_tobaseline.m`**:  
  Function to identify neurons that show significant responses to stimulation.

- **`neighbor_neuron_pair_correlation.m`**:  
  Script to compute Pearson correlation between pairs of neurons over distances from 0 to 600 μm.

- **`CNMF_analysis.m`**:  
  Script for calculating firing rates, peak ΔF/F₀, peak SNR, and the single-spike calcium kernel using CNMF (Constrained Non-negative Matrix Factorization) results.  
  **Note**: Ensure the path to `scripts_2photon_analysis/utils` is added for function calls.

  Execution time: Approximately 10 minutes on a standard desktop. All figures used in the paper are generated by this script.

---

## 1-Photon Mouse In Vivo Imaging Analysis

### Script:
- **`CNMF_E_analysis.m`**:  
  Comprehensive analysis script that provides:
  1. Visualization of sample traces and spike event traces
  2. Firing rate calculations
  3. PCC (Pixel Cross Correlation) image generation
  4. PCC plots
  5. Peak ΔF/F₀
  6. Peak SNR
  7. Decay time
  8. Detection of the number of neurons  
  **Note**: Add the path to `scripts_1photon_mouse_invivo_analysis/utils` for function calls.

Execution time: Approximately 10 minutes on a standard desktop. All figures presented in the paper are generated by this script. A demo dataset is available in the repository, and the corresponding paths are referenced within the code.

---

## Zebrafish and Neuronal Culture Analysis
The following scripts are provided for analyzing zebrafish and neuronal culture datasets:

### Scripts:
- **`dff_Analysis_zebrafish.m`**:  
  Pipeline for calculating peak ΔF/F₀ in zebrafish datasets.
  First, we use Imagej to determine the ROI in the acquired images then extract the fluorescence trace of each ROI which are stored in xlsx file. This MATLAB script then process these xlsx files, producing peak ΔF/F₀ of each ROI.

- **`SNR_Analysis_zebrafish.m`**:  
  Pipeline for calculating peak SNR in zebrafish datasets.
  Similar to the former script, this MATLAB script receives input as xlsx files, then produces peak SNR of each ROI.

- **`rise.m`**:  
  Code to calculate half-rise time from isolated spike traces extracted from neuronal culture and zebrafish data. 

- **`rise_func.m`**:  
  Function for calculating half-rise time in neuronal culture and zebrafish datasets.

- **`decay.m`**:  
   Code to calculate half-decay time from isolated spike traces extracted from neuronal culture and zebrafish data.
  
- **`decay_func.m`**:  
  Function for calculating half-decay time in neuronal culture and zebrafish datasets.

---
## Demo Datasets

The repository contains a data folder with demo datasets corresponding to each analysis. Detailed instructions for accessing and using these datasets are included within each script.
