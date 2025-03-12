#!/usr/bin/env python
"""
Pipeline for Calcium Imaging Analysis

This unified script performs the complete processing of two-photon calcium imaging data
and includes the following steps (each implemented as a function):

1. Preprocess ND2 Files: Convert ND2 files into TIFF images.
2. Motion Correction: Correct motion in the imaging data using CaImAn.
3. Cellpose Segmentation: Segment cells from the motion-corrected images using Cellpose.
4. Interpret Data: Extract signals, calculate dF/F, identify responsive neurons,
   and generate visualizations.
5. Merge Results: Merge results from multiple experiments into summary files.

"""

import os
import numpy as np
import tifffile as tiff
import nd2

# ----- For Motion Correction -----
import argparse
import cv2
import glob
import logging
import matplotlib
import caiman
from caiman.motion_correction import MotionCorrect
from caiman.source_extraction.cnmf import cnmf as cnmf_module
from caiman.source_extraction.cnmf import params as params_module
from caiman.summary_images import local_correlations_movie_offline
from caiman.utils.utils import download_demo

# ----- For Cellpose Segmentation -----
from cellpose import models, io

# ----- For Merging and Plotting -----
from scipy.io import loadmat, savemat
import skimage.io as skio
import matplotlib.pyplot as plt

# ----- For Data Interpretation -----
import h5py
from scipy.sparse import csc_matrix
from pybaselines import Baseline
from tqdm import tqdm

# =============================================================================
# Step 1: Preprocess ND2 Files (Conversion to TIFF)
# =============================================================================
def preprocess_nd2_to_tiff(nd2_dir, output_dir):
    """
    Convert all ND2 files in the given directory into TIFF images.
    For each ND2 file, each channel and each z-slice is saved as a separate TIFF file.
    
    Parameters:
    - nd2_dir: Directory containing the ND2 files.
    - output_dir: Directory where TIFF images will be saved.
    """
    if not os.path.exists(output_dir):
        os.makedirs(output_dir)
    for file in os.listdir(nd2_dir):
        if file.endswith(".nd2"):
            print(f"Processing ND2 file: {file} ...")
            data = nd2.imread(os.path.join(nd2_dir, file))
            # Loop over channels and z-slices; data shape assumed to be: (X, Z, Channels, Y, X)
            for ci in range(data.shape[2]):
                for zi in range(data.shape[1]):
                    out_filename = os.path.join(
                        output_dir,
                        os.path.splitext(file)[0] + f"_ch{ci}_z{zi}.tif"
                    )
                    tiff.imwrite(out_filename, data[:, zi, ci, :, :])
    print("Preprocessing complete: ND2 files have been converted to TIFF.")

# =============================================================================
# Helper Function for Motion Correction Parameters
# =============================================================================
def make_params(movie_path):
    """
    Create a parameter dictionary for motion correction and CNMF processing.
    
    Parameters:
    - movie_path: Path to the movie file.
    
    Returns:
    - parameter_dict: Dictionary of parameters.
    """
    fr = 1.09  # Imaging rate in frames per second
    decay_time = 0.4
    dxy = (0.17, 0.17)
    strides = (48, 48)
    overlaps = (24, 24)
    max_shifts = (6, 6)
    max_deviation_rigid = 3
    pw_rigid = True
    p = 0
    gnb = 2
    merge_thr = 0.85
    bas_nonneg = True
    rf = 25
    stride_cnmf = 15
    K = 10
    gSig = np.array([5, 5])
    gSiz = 2 * gSig + 1
    method_init = 'greedy_roi'
    ssub = 1
    tsub = 1
    min_SNR = 2.0
    rval_thr = 0.85
    cnn_thr = 0.99
    cnn_lowest = 0.1

    parameter_dict = {
        'fnames': [movie_path],
        'fr': fr,
        'dxy': dxy,
        'decay_time': decay_time,
        'strides': strides,
        'overlaps': overlaps,
        'max_shifts': max_shifts,
        'max_deviation_rigid': max_deviation_rigid,
        'pw_rigid': pw_rigid,
        'p': p,
        'nb': gnb,
        'rf': rf,
        'K': K,
        'gSig': gSig,
        'gSiz': gSiz,
        'stride': stride_cnmf,
        'method_init': method_init,
        'rolling_sum': True,
        'only_init': True,
        'ssub': ssub,
        'tsub': tsub,
        'merge_thr': merge_thr,
        'bas_nonneg': bas_nonneg,
        'min_SNR': min_SNR,
        'rval_thr': rval_thr,
        'use_cnn': True,
        'min_cnn_thr': cnn_thr,
        'cnn_lowest': cnn_lowest
    }
    return parameter_dict

# =============================================================================
# Step 2: Motion Correction
# =============================================================================
def motion_correction_pipeline(movie_path, result_file, save_motion_corrected=None,
                               no_play=True, logfile=None,
                               cluster_backend="multiprocessing", cluster_nproc=None,
                               keep_logs=True):
    """
    Perform motion correction on the movie file using CaImAn.
    
    Parameters:
    - movie_path: Path to the input movie (TIFF file).
    - result_file: Path to save the motion correction result summary.
    - save_motion_corrected: Optional path to save the motion-corrected movie.
    - no_play: If True, skip playing the movie.
    - logfile: Optional log file path.
    - cluster_backend: Cluster backend type.
    - cluster_nproc: Number of processes.
    - keep_logs: If True, keep log files.
    
    Returns:
    - result_file: The path where the result summary is saved.
    """
    # Create a configuration object
    cfg = argparse.Namespace()
    cfg.logfile = logfile
    cfg.keep_logs = keep_logs
    cfg.no_play = no_play
    cfg.cluster_backend = cluster_backend
    cfg.cluster_nproc = cluster_nproc

    # Build parameter dictionary
    params_dict = make_params(movie_path)

    # Set up logging
    logger = logging.getLogger("caiman")
    logger.setLevel(logging.INFO)
    logfmt = logging.Formatter("[%(filename)s:%(funcName)s():%(lineno)d] %(message)s")
    if cfg.logfile:
        handler = logging.FileHandler(cfg.logfile)
    else:
        handler = logging.StreamHandler()
    handler.setFormatter(logfmt)
    logger.addHandler(handler)

    # Create CNMF parameters object
    opts = params_module.CNMFParams(params_dict=params_dict)
    opts.change_params({"data": {"fnames": params_dict['fnames']}})

    # Load the movie chain
    m_orig = caiman.load_movie_chain(opts.data['fnames'])

    # Optionally play the original movie
    if not cfg.no_play:
        ds_ratio = 0.2
        moviehandle = m_orig.resize(1, 1, ds_ratio)
        moviehandle.play(q_max=99.5, fr=60, magnification=2)

    # Set up a parallel processing cluster
    c, dview, n_processes = caiman.cluster.setup_cluster(backend=cfg.cluster_backend,
                                                          n_processes=cfg.cluster_nproc)

    # Initialize motion correction
    mc = MotionCorrect(opts.data['fnames'], dview=dview, **opts.get_group('motion'))
    mc.motion_correct(save_movie=True)

    # Optionally play the motion-corrected movie
    if not cfg.no_play:
        m_orig = caiman.load_movie_chain(opts.data['fnames'])
        m_els = caiman.load(mc.mmap_file)
        ds_ratio = 0.2
        moviehandle = caiman.concatenate([m_orig.resize(1, 1, ds_ratio) - mc.min_mov * mc.nonneg_movie,
                                          m_els.resize(1, 1, ds_ratio)], axis=2)
        moviehandle.play(fr=60, q_max=99.5, magnification=2)

    # Save the motion-corrected movie if requested
    if save_motion_corrected:
        m_els = caiman.load(mc.mmap_file)
        tiff.imwrite(save_motion_corrected, m_els)

    # Shut down the cluster to clean up resources
    caiman.stop_server(dview=dview)

    # Save a summary result file
    with open(result_file, 'w') as f:
        f.write("Motion correction completed for movie: " + movie_path)

    print("Motion correction completed.")
    return result_file

# =============================================================================
# Step 3: Run Cellpose Segmentation
# =============================================================================
def run_cellpose_segmentation(input_dir, output_dir, model_type="cyto3", gpu=True):
    """
    Run Cellpose segmentation on average images computed from motion-corrected TIFF files.
    
    Parameters:
    - input_dir: Directory containing the motion-corrected TIFF files.
    - output_dir: Directory to save the segmentation results.
    - model_type: Type of Cellpose model to use (e.g., "cyto3" or "nuclei").
    - gpu: Use GPU if True.
    """
    if not os.path.exists(output_dir):
        os.makedirs(output_dir)
    # Set up Cellpose model
    model = models.Cellpose(gpu=gpu, model_type=model_type)
    average_images = []
    file_names = []
    
    # Loop over TIFF files ending with "motion_corrected.tif"
    for file_name in os.listdir(input_dir):
        if not file_name.endswith("motion_corrected.tif"):
            continue
        image = tiff.imread(os.path.join(input_dir, file_name))
        # Compute the average image over time (axis=0)
        average_image = np.mean(image, axis=0)
        average_images.append(average_image)
        file_names.append(file_name)
    
    # Run segmentation with Cellpose (using single-channel input)
    masks_pred, flows, styles, diams = model.eval(average_images, diameter=0, channels=[0,0])
    
    # Save the average images and corresponding masks
    for i in range(len(masks_pred)):
        base_name = os.path.splitext(file_names[i])[0]
        avg_filename = os.path.join(output_dir, f"{base_name}_average.tif")
        mask_filename = os.path.join(output_dir, f"{base_name}_masks.tif")
        tiff.imwrite(avg_filename, average_images[i])
        tiff.imwrite(mask_filename, masks_pred[i])
    print("Cellpose segmentation completed.")

# =============================================================================
# Helper Functions for Data Interpretation (from Step 4)
# =============================================================================
def calculate_iou(mask1, mask2, label1, label2):
    """Calculate Intersection over Union (IoU) for two masks."""
    intersection = np.logical_and(mask1 == label1, mask2 == label2).sum()
    union = np.logical_or(mask1 == label1, mask2 == label2).sum()
    if union == 0:
        return 0
    return intersection / union

def find_matching_cells(mask_image_1, mask_image_2, iou_threshold=0.5):
    """
    Find matching cells between two mask images using IoU.
    
    Returns:
    - matching_pairs: List of tuples (label1, label2) for matched cells.
    """
    matching_pairs = []
    used_labels_2 = set()
    labels_1 = np.unique(mask_image_1)
    labels_2 = np.unique(mask_image_2)
    labels_1 = labels_1[labels_1 != 0]  # Exclude background (label 0)
    labels_2 = labels_2[labels_2 != 0]
    for label1 in tqdm(labels_1, desc="Matching cells"):
        best_iou = 0
        best_label2 = None
        for label2 in labels_2:
            if label2 in used_labels_2:
                continue
            iou = calculate_iou(mask_image_1, mask_image_2, label1, label2)
            if iou > best_iou:
                best_iou = iou
                best_label2 = label2
        if best_iou >= iou_threshold and best_label2 is not None:
            matching_pairs.append((label1, best_label2))
            used_labels_2.add(best_label2)
    return matching_pairs

def get_simulataneous_signal(image_1, image_2, mask_image_1, mask_image_2, iou_threshold=0.5):
    """
    Extract average signals from corresponding cells between two images.
    
    Returns:
    - average_signals_1, average_signals_2: Arrays of average signals.
    - matching_pairs: The matching cell labels.
    """
    def extract_average_signal(image, mask, label):
        region = (mask == label)
        if np.sum(region) == 0:
            return None
        return np.mean(image[:, region], axis=1)
    
    matching_pairs = find_matching_cells(mask_image_1, mask_image_2, iou_threshold)
    print(f"Matching pairs: {matching_pairs}")
    average_signals_1 = []
    average_signals_2 = []
    for label1, label2 in tqdm(matching_pairs, desc="Extracting signals"):
        avg_signal_1 = extract_average_signal(image_1, mask_image_1, label1)
        avg_signal_2 = extract_average_signal(image_2, mask_image_2, label2)
        if avg_signal_1 is not None and avg_signal_2 is not None:
            average_signals_1.append(avg_signal_1)
            average_signals_2.append(avg_signal_2)
    return np.array(average_signals_1), np.array(average_signals_2), matching_pairs

def dF_F_calculation(raw_signal, method='spline', lam=1e6):
    """
    Calculate dF/F using the specified method.
    
    Parameters:
    - raw_signal: 2D array of raw signals [n_cells x n_frames]
    - method: 'spline' or 'percentile'
    - lam: Regularization parameter for spline fitting
    
    Returns:
    - dF_F: dF/F calculated signal
    - F0_array: Baseline fluorescence values
    """
    dF_F = np.zeros_like(raw_signal)
    F0_array = np.zeros_like(raw_signal)
    if method == 'spline':
        baseline_corrector = Baseline()
        for i in tqdm(range(raw_signal.shape[0]), desc="Calculating dF/F"):
            try:
                F0, _ = baseline_corrector.mixture_model(raw_signal[i, :], lam=lam)
            except:
                F0 = np.percentile(raw_signal[i, :], 5)
            current_dF_F = (raw_signal[i, :] - F0) / F0
            dF_F[i, :] = current_dF_F
            F0_array[i, :] = F0
    elif method == "percentile":
        for i in tqdm(range(raw_signal.shape[0]), desc="Calculating dF/F"):
            F0 = np.percentile(raw_signal[i, :], 5)
            current_dF_F = (raw_signal[i, :] - F0) / F0
            dF_F[i, :] = current_dF_F
            F0_array[i, :] = F0
    else:
        raise ValueError(f"Invalid method: {method}")
    return dF_F, F0_array

def get_responsive_neurons(dF_F, sigma=2.5,
                           stimulations=[[40, 70, 100, 130], [160, 190, 220], [250]],
                           time_window=3):
    """
    Identify responsive neurons based on the dF/F signal.
    
    A neuron is considered responsive if its dF/F signal exceeds
    (baseline mean + sigma * baseline std) for more than 'time_window' frames.
    
    Returns:
    - responsive_neurons: List of responsive neuron indices per stimulation group.
    """
    num_neurons, num_frames = dF_F.shape
    pre_stim_frames = stimulations[0][0]
    baseline_mean = np.mean(dF_F[:, :pre_stim_frames], axis=1)
    baseline_std = np.std(dF_F[:, :pre_stim_frames], axis=1)
    threshold = baseline_mean + sigma * baseline_std
    responsive_neurons = []
    for stim_group in stimulations:
        group_responsive = set()
        for i, stim_start in enumerate(stim_group):
            stim_end = stim_group[i+1] if i+1 < len(stim_group) else num_frames
            for neuron_idx in range(num_neurons):
                above_threshold = dF_F[neuron_idx, stim_start:stim_end] > threshold[neuron_idx]
                if np.sum(above_threshold) >= time_window:
                    group_responsive.add(neuron_idx)
        responsive_neurons.append(sorted(list(group_responsive)))
    return responsive_neurons

def plot_rasterplot(avg_signals_1, avg_signals_2, vertical_lines, save_path):
    """
    Generate a raster plot for two channels and save the figure.
    
    Parameters:
    - avg_signals_1, avg_signals_2: 2D arrays of dF/F signals.
    - vertical_lines: List of frame indices for vertical reference lines.
    - save_path: Path to save the generated plot.
    """
    fig, axes = plt.subplots(1, 2, figsize=(20, 10))
    max_val = max(np.max(avg_signals_1), np.max(avg_signals_2))
    im1 = axes[0].imshow(avg_signals_1, aspect='auto', cmap='turbo', vmin=0, vmax=max_val)
    axes[0].set_title("Channel 1 (RiboL1-jGCaMP8s)", fontsize=20)
    axes[0].set_xlabel("Time (frames)", fontsize=15)
    axes[0].set_ylabel("Cell #", fontsize=15)
    for x in vertical_lines:
        axes[0].axvline(x=x, color='red', linestyle='--', linewidth=1)
    plt.colorbar(im1, ax=axes[0])
    
    im2 = axes[1].imshow(avg_signals_2, aspect='auto', cmap='turbo', vmin=0, vmax=max_val)
    axes[1].set_title("Channel 2 (FRCaMPi)", fontsize=20)
    axes[1].set_xlabel("Time (frames)", fontsize=15)
    axes[1].set_ylabel("Cell #", fontsize=15)
    for x in vertical_lines:
        axes[1].axvline(x=x, color='red', linestyle='--', linewidth=1)
    plt.colorbar(im2, ax=axes[1])
    
    plt.tight_layout()
    plt.savefig(save_path, format='png')

def visualize_max_dff(avg_signals_1_dFF, avg_signals_2_dFF, save_png_path):
    """
    Visualize and compare maximum dF/F values for two channels.
    
    Parameters:
    - avg_signals_1_dFF, avg_signals_2_dFF: 2D arrays of dF/F signals.
    - save_png_path: Path to save the comparison plot.
    
    Returns:
    - max_dff_1, max_dff_2: Arrays of maximum dF/F values for each channel.
    """
    max_dff_1 = np.max(avg_signals_1_dFF, axis=1)
    max_dff_2 = np.max(avg_signals_2_dFF, axis=1)
    fig, ax = plt.subplots(figsize=(10, 10))
    ax.scatter(max_dff_1, max_dff_2)
    ax.set_title("Max dF/F Comparison", fontsize=20)
    ax.set_xlabel("Max dF/F (Channel 1)", fontsize=15)
    ax.set_ylabel("Max dF/F (Channel 2)", fontsize=15)
    max_val = max(np.max(max_dff_1), np.max(max_dff_2))
    ax.set_xlim([0, max_val])
    ax.set_ylim([0, max_val])
    ax.plot([0, max_val], [0, max_val], color='red', linestyle='--')
    plt.tight_layout()
    plt.savefig(save_png_path, format='png')
    return max_dff_1, max_dff_2

def draw_simple_plot(signal_1, signal_2, save_path):
    """
    Draw an overlay plot of two signals and save the figure.
    
    Parameters:
    - signal_1: 1D array for channel 1.
    - signal_2: 1D array for channel 2.
    - save_path: Path to save the plot.
    """
    fig, ax = plt.subplots(figsize=(20, 10))
    ax.plot(signal_1, label="Channel 1 (RiboL1-jGCaMP8s)", color='green')
    ax.plot(signal_2, label="Channel 2 (FRCaMPi)", color='red')
    ax.set_title("Simultaneous Signal Comparison", fontsize=20)
    ax.set_xlabel("Time (frames)", fontsize=15)
    ax.set_ylabel("dF/F", fontsize=15)
    ax.legend()
    plt.tight_layout()
    plt.savefig(save_path, format='png')

def get_file_names():
    """
    Generate file name lists for multiple experiments.
    
    Returns:
    - ribo_gcamps: List of lists with channel 1 file names.
    - frcampis: List of lists with channel 2 file names.
    - stimulations: List of stimulation schemes for each experiment.
    """
    ribo_gcamps = []
    frcampis = []
    stimulations = []
    
    # Experiment 1
    tmp_ribo = []
    tmp_frcampi = []
    for z in range(5):
        tmp_ribo.append(f"stom 40 70 100 130 int 160 190 220 lar 250 8 frames stim003_ch0_z{z}_motion_corrected.tif")
        tmp_frcampi.append(f"stom 40 70 100 130 int 160 190 220 lar 250 8 frames stim003_ch1_z{z}_motion_corrected.tif")
    ribo_gcamps.append(tmp_ribo)
    frcampis.append(tmp_frcampi)
    stimulations.append([[40, 70, 100, 130], [160, 190, 220], [250]])
    
    # Experiment 2
    tmp_ribo = []
    tmp_frcampi = []
    for z in range(5):
        tmp_ribo.append(f"stom 40 70 100 130 int 160 190 220 lar 250 10frames stim004_ch0_z{z}_motion_corrected.tif")
        tmp_frcampi.append(f"stom 40 70 100 130 int 160 190 220 lar 250 10frames stim004_ch1_z{z}_motion_corrected.tif")
    ribo_gcamps.append(tmp_ribo)
    frcampis.append(tmp_frcampi)
    stimulations.append([[40, 70, 100, 130], [160, 190, 220], [250]])
    
    # Experiment 3
    tmp_ribo = []
    tmp_frcampi = []
    for z in range(5):
        tmp_ribo.append(f"stom 40 70 100 130 int 160 190 220 lar 250 RNTS_ch0_z{z}_motion_corrected.tif")
        tmp_frcampi.append(f"stom 40 70 100 130 int 160 190 220 lar 250 RNTS_ch1_z{z}_motion_corrected.tif")
    ribo_gcamps.append(tmp_ribo)
    frcampis.append(tmp_frcampi)
    stimulations.append([[40, 70, 100, 130], [160, 190, 220], [250]])
    
    # Experiment 4
    tmp_ribo = []
    tmp_frcampi = []
    for z in range(5):
        tmp_ribo.append(f"stom 40 70 100 130 int 160 190 220 LNTS pre_ch0_z{z}_motion_corrected.tif")
        tmp_frcampi.append(f"stom 40 70 100 130 int 160 190 220 LNTS pre_ch1_z{z}_motion_corrected.tif")
    ribo_gcamps.append(tmp_ribo)
    frcampis.append(tmp_frcampi)
    stimulations.append([[40, 70, 100, 130], [160, 190, 220]])
    
    return ribo_gcamps, frcampis, stimulations

# =============================================================================
# Step 4: Data Interpretation and Visualization
# =============================================================================
def interpret_data(root_dir, results_dir):
    """
    Process motion-corrected data to extract signals, calculate dF/F,
    identify responsive neurons, and generate visualizations.
    
    Parameters:
    - root_dir: Directory containing the processed TIFF files.
    - results_dir: Directory to save the generated figures and MAT files.
    """
    if not os.path.exists(results_dir):
        os.makedirs(results_dir)
    
    ribo_gcamps, frcampis, stimulations = get_file_names()
    for exp_idx in range(len(ribo_gcamps)):
        for z in range(len(ribo_gcamps[exp_idx])):
            current_ribo_path = os.path.join(root_dir, ribo_gcamps[exp_idx][z])
            current_frcampi_path = os.path.join(root_dir, frcampis[exp_idx][z])
            print(f"Processing files:\n  {current_ribo_path}\n  {current_frcampi_path}")
            
            # Load images and corresponding mask images
            image_1 = tiff.imread(current_ribo_path)
            image_2 = tiff.imread(current_frcampi_path)
            mask_image_1 = tiff.imread(current_ribo_path.replace("motion_corrected.tif", "motion_corrected_masks.tif"))
            mask_image_2 = tiff.imread(current_frcampi_path.replace("motion_corrected.tif", "motion_corrected_masks.tif"))
            
            base_filename = os.path.splitext(os.path.basename(current_ribo_path))[0]
            save_mat = os.path.join(results_dir, f"{base_filename}_signal_data.mat")
            rasterplot_path = os.path.join(results_dir, f"{base_filename}_rasterplot.png")
            max_dff_path = os.path.join(results_dir, f"{base_filename}_max_dff_comparison.png")
            mask_save_path = os.path.join(results_dir, f"{base_filename}_responsive_neurons.png")
            
            # Extract simultaneous signals from matching cells
            avg_signals_1, avg_signals_2, matching_pairs = get_simulataneous_signal(
                image_1, image_2, mask_image_1, mask_image_2, iou_threshold=0.5)
            
            # Calculate dF/F using the spline method
            avg_signals_1_dFF, _ = dF_F_calculation(avg_signals_1, method="spline")
            avg_signals_2_dFF, _ = dF_F_calculation(avg_signals_2, method="spline")
            
            # Generate a raster plot for both channels
            plot_rasterplot(avg_signals_1_dFF, avg_signals_2_dFF,
                            sum(stimulations[exp_idx], []), rasterplot_path)
            
            # Visualize maximum dF/F comparison
            visualize_max_dff(avg_signals_1_dFF, avg_signals_2_dFF, max_dff_path)
            
            # Identify responsive neurons in each channel
            responsive_neurons_1 = get_responsive_neurons(avg_signals_1_dFF, sigma=2.5,
                                                          stimulations=stimulations[exp_idx], time_window=3)
            responsive_neurons_2 = get_responsive_neurons(avg_signals_2_dFF, sigma=2.5,
                                                          stimulations=stimulations[exp_idx], time_window=3)
            
            # Map the responsive neuron indices to original labels using matching pairs
            original_responsive_neurons_1 = []
            for group in responsive_neurons_1:
                original_responsive_neurons_1.append([matching_pairs[idx][0] for idx in group])
            original_responsive_neurons_2 = []
            for group in responsive_neurons_2:
                original_responsive_neurons_2.append([matching_pairs[idx][1] for idx in group])
            
            print(f"Responsive neurons (Channel 1): {original_responsive_neurons_1}")
            print(f"Responsive neurons (Channel 2): {original_responsive_neurons_2}")
            
            # Create overlay images for responsive neurons
            final_image_1 = np.zeros((*mask_image_1.shape, 3), dtype=np.uint8)
            final_image_1[mask_image_1 > 0] = [255, 255, 255]
            for group in original_responsive_neurons_1:
                for neuron_idx in group:
                    final_image_1[mask_image_1 == neuron_idx] = [255, 0, 0]
            
            final_image_2 = np.zeros((*mask_image_2.shape, 3), dtype=np.uint8)
            final_image_2[mask_image_2 > 0] = [255, 255, 255]
            for group in original_responsive_neurons_2:
                for neuron_idx in group:
                    final_image_2[mask_image_2 == neuron_idx] = [255, 0, 0]
            
            # Plot and save the overlay images side-by-side
            fig, axes = plt.subplots(1, 2, figsize=(20, 10))
            axes[0].imshow(final_image_1)
            axes[0].set_title("Responsive Neurons - Channel 1")
            axes[0].axis('off')
            axes[1].imshow(final_image_2)
            axes[1].set_title("Responsive Neurons - Channel 2")
            axes[1].axis('off')
            plt.savefig(mask_save_path, format='png')
            
            # Save the extracted signals and responsive neuron data as a MAT file
            savemat(save_mat, {
                "avg_signals_ribogcamp_dFF": avg_signals_1_dFF,
                "avg_signals_frcampi_dFF": avg_signals_2_dFF,
                "matching_pairs": np.array(matching_pairs, dtype=object),
                "original_responsive_neurons_1": np.array(original_responsive_neurons_1, dtype=object),
                "original_responsive_neurons_2": np.array(original_responsive_neurons_2, dtype=object),
                "mask_image_1": mask_image_1,
                "mask_image_2": mask_image_2,
                "final_image_RiboL1": final_image_1,
                "final_image_FRCaMPi": final_image_2
            })
    print("Data interpretation and visualization completed.")

# =============================================================================
# Step 5: Merge Results from Multiple Experiments
# =============================================================================
def merge_results(exp_names, root_dir, save_root_dir):
    """
    Merge results from multiple experiments by concatenating signal data
    and combining responsive neuron overlays.
    
    Parameters:
    - exp_names: List of experiment name strings.
    - root_dir: Directory where individual MAT and image files are stored.
    - save_root_dir: Directory to save the merged results.
    """
    if not os.path.exists(save_root_dir):
        os.makedirs(save_root_dir)
    for exp_name in exp_names:
        # Construct file names for each z-stack (assumes 5 z-slices)
        mat_files = [f"{exp_name}_ch0_z{z}_motion_corrected_signal_data.mat" for z in range(5)]
        save_file_name = f"{exp_name}.png"
        
        avg_signals_ribo_list = []
        avg_signals_frcampi_list = []
        for mat_file in mat_files:
            data = loadmat(os.path.join(root_dir, mat_file))
            avg_signals_ribo_list.append(data["avg_signals_ribogcamp_dFF"])
            avg_signals_frcampi_list.append(data["avg_signals_frcampi_dFF"])
        avg_signals_ribo = np.concatenate(avg_signals_ribo_list, axis=0)
        avg_signals_frcampi = np.concatenate(avg_signals_frcampi_list, axis=0)
        
        # Save the merged signals as a MAT file
        save_data = {
            "avg_signals_ribogcamp_dFF": avg_signals_ribo,
            "avg_signals_frcampi_dFF": avg_signals_frcampi
        }
        savemat(os.path.join(save_root_dir, f"{exp_name}.mat"), save_data)
        
        # Merge responsive neuron overlay images for two channels
        z_stack_total_RiboL1 = np.zeros((512, 512, 3), dtype=np.uint8)
        z_stack_total_FRCaMPi = np.zeros((512, 512, 3), dtype=np.uint8)
        
        # For RiboL1
        z_stack_white = np.zeros((512, 512), dtype=np.uint8)
        z_stack_red = np.zeros((512, 512), dtype=np.uint8)
        z_stack_green = np.zeros((512, 512), dtype=np.uint8)
        z_stack_blue = np.zeros((512, 512), dtype=np.uint8)
        
        for mat_file in mat_files:
            data = loadmat(os.path.join(root_dir, mat_file))
            final_image = data["final_image_RiboL1"]
            white_pixels = np.all(final_image == [255, 255, 255], axis=2)
            red_pixels = np.all(final_image == [255, 0, 0], axis=2)
            green_pixels = np.all(final_image == [0, 255, 0], axis=2)
            blue_pixels = np.all(final_image == [0, 0, 255], axis=2)
            z_stack_white[white_pixels] = 255
            z_stack_red[red_pixels] = 255
            z_stack_green[green_pixels] = 255
            z_stack_blue[blue_pixels] = 255
        z_stack_total_RiboL1[z_stack_white > 0] = [255, 255, 255]
        z_stack_total_RiboL1[z_stack_red > 0] = [255, 0, 0]
        z_stack_total_RiboL1[z_stack_green > 0] = [0, 255, 0]
        z_stack_total_RiboL1[z_stack_blue > 0] = [0, 0, 255]
        
        # For FRCaMPi
        z_stack_white = np.zeros((512, 512), dtype=np.uint8)
        z_stack_red = np.zeros((512, 512), dtype=np.uint8)
        z_stack_green = np.zeros((512, 512), dtype=np.uint8)
        z_stack_blue = np.zeros((512, 512), dtype=np.uint8)
        
        for mat_file in mat_files:
            data = loadmat(os.path.join(root_dir, mat_file))
            final_image = data["final_image_FRCaMPi"]
            white_pixels = np.all(final_image == [255, 255, 255], axis=2)
            red_pixels = np.all(final_image == [255, 0, 0], axis=2)
            green_pixels = np.all(final_image == [0, 255, 0], axis=2)
            blue_pixels = np.all(final_image == [0, 0, 255], axis=2)
            z_stack_white[white_pixels] = 255
            z_stack_red[red_pixels] = 255
            z_stack_green[green_pixels] = 255
            z_stack_blue[blue_pixels] = 255
        z_stack_total_FRCaMPi[z_stack_white > 0] = [255, 255, 255]
        z_stack_total_FRCaMPi[z_stack_red > 0] = [255, 0, 0]
        z_stack_total_FRCaMPi[z_stack_green > 0] = [0, 255, 0]
        z_stack_total_FRCaMPi[z_stack_blue > 0] = [0, 0, 255]
        
        # Plot and save the merged overlay images
        fig, axes = plt.subplots(1, 2, figsize=(20, 10))
        axes[0].imshow(z_stack_total_RiboL1)
        axes[0].set_title("RiboL1")
        axes[0].axis("off")
        axes[1].imshow(z_stack_total_FRCaMPi)
        axes[1].set_title("FRCaMPi")
        axes[1].axis("off")
        plt.savefig(os.path.join(save_root_dir, save_file_name))
    print("Results merging completed.")

# =============================================================================
# Main Execution (Example Usage)
# =============================================================================
if __name__ == "__main__":
    # Define directories (update these paths as needed)
    nd2_directory = "/path/to/nd2_files"
    tiff_output_directory = "/path/to/tiff_output"
    motion_corrected_movie = "/path/to/motion_corrected_movie.tif"
    motion_result_file = "/path/to/motion_result.txt"
    cellpose_output_directory = "/path/to/cellpose_output"
    processed_data_directory = "/path/to/processed_data"
    interpretation_results_directory = "/path/to/interpretation_results"
    merged_results_directory = "/path/to/merged_results"

    # Example calls (uncomment the steps you want to run)
    
    # Step 1: Preprocess ND2 files
    # preprocess_nd2_to_tiff(nd2_directory, tiff_output_directory)
    
    # Step 2: Motion Correction
    # motion_correction_pipeline(movie_path=os.path.join(tiff_output_directory, "example_movie.tif"),
    #                            result_file=motion_result_file,
    #                            save_motion_corrected=motion_corrected_movie)
    
    # Step 3: Run Cellpose Segmentation
    # run_cellpose_segmentation(input_dir=tiff_output_directory, output_dir=cellpose_output_directory)
    
    # Step 4: Data Interpretation and Visualization
    # interpret_data(root_dir=processed_data_directory, results_dir=interpretation_results_directory)
    
    # Step 5: Merge Results from Multiple Experiments
    # Define experiment names as a list (example names)
    # experiment_names = [
    #     "stom 40 70 100 130 int 160 190 220 lar 250 10frames stim004",
    #     "stom 40 70 100 130 int 160 190 220 lar 250 8 frames stim003",
    #     "stom 40 70 100 130 int 160 190 220 lar 250 RNTS",
    #     "stom 40 70 100 130 int 160 190 220 LNTS pre"
    # ]
    # merge_results(experiment_names, root_dir=interpretation_results_directory, save_root_dir=merged_results_directory)
    
    print("Pipeline execution completed.")
