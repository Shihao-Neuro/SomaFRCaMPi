# Sensitive Red Fluorescent Calcium Indicators for Multi-Modality Imaging of Neuronal Populations In Vivo

**Authors**:  
Shihao Zhou, Qiyu Zhu, Minho Eom, Shilin Fang, Oksana M. Subach, Yangdong Wang, Jiewen Hu, Hanbin Zhang, Zhiyuan Wang, Xiaoting Sun, Mu Yu, Young-Gyu Yoon, Zengcai V. Guo, Fedor V. Subach, Kiryl D. Piatkevich

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

---

## Zebrafish and Neuronal Culture Analysis

### Scripts:
- **`dff_Analysis_zebrafish.m`**:  
  Pipeline for calculating peak ΔF/F₀ in zebrafish datasets.

- **`SNR_Analysis_zebrafish.m`**:  
  Pipeline for calculating peak SNR in zebrafish datasets.

- **`rise.m`**:  
  Code to calculate half-rise time in neuronal culture and zebrafish datasets.

- **`rise_func.m`**:  
  Function for calculating half-rise time in neuronal culture and zebrafish datasets.

- **`decay.m`**:  
  Code to calculate half-decay time in neuronal culture and zebrafish datasets.

- **`decay_func.m`**:  
  Function for calculating half-decay time in neuronal culture and zebrafish datasets.
