# Calcium Imaging Analysis Pipeline

This repository now contains a unified Python script (`main.py`) that implements a complete analysis pipeline for calcium imaging data. The pipeline is organized into five modular steps, each encapsulated in a separate function for clarity and ease of use.

## Pipeline Overview

The unified pipeline includes the following steps:

1. **Preprocess ND2 Files**
   - **Function:** `preprocess_nd2_to_tiff(nd2_dir, output_dir)`
   - **Description:** Converts ND2 files (raw imaging data) into individual TIFF images for each channel and z-slice.

2. **Motion Correction**
   - **Function:** `motion_correction_pipeline(movie_path, result_file, save_motion_corrected, ...)`
   - **Description:** Performs motion correction on the imaging data using the CaImAn package. This step corrects for motion artifacts in the raw movie data.

3. **Cellpose Segmentation**
   - **Function:** `run_cellpose_segmentation(input_dir, output_dir, model_type, gpu)`
   - **Description:** Uses Cellpose to segment cells from the motion-corrected images. Average images are generated and used for segmentation, and the results (masks) are saved.

4. **Data Interpretation and Visualization**
   - **Function:** `interpret_data(root_dir, results_dir)`
   - **Description:** Extracts calcium signals from segmented cells, calculates dF/F, identifies responsive neurons based on stimulation protocols, and creates various plots (raster plots, overlay images, max dF/F comparisons). The results are saved as MAT files and PNG images.

5. **Merge Results**
   - **Function:** `merge_results(exp_names, root_dir, save_root_dir)`
   - **Description:** Merges results from multiple experiments by concatenating signal data and combining responsive neuron overlays into summary images and MAT files.

## Installation and Dependencies

- **Python 3.10** (or later)
- **Required Python packages:**
  - nd2
  - tifffile
  - numpy
  - caiman
  - opencv-python
  - cellpose
  - scipy
  - matplotlib
  - pybaselines
  - tqdm
  - (and any additional dependencies as listed in the original requirements)

Please install the required packages via `pip` or `conda` as appropriate.

## Usage

1. **Preprocessing ND2 Files**
   - Update the `nd2_directory` and `tiff_output_directory` paths in `pipeline.py`.
   - Uncomment and run the call to `preprocess_nd2_to_tiff()`.

2. **Motion Correction**
   - Provide the path to the movie (TIFF) file.
   - Set output paths for the motion-corrected movie and result summary.
   - Uncomment and run the call to `motion_correction_pipeline()`.

3. **Cellpose Segmentation**
   - Set the input and output directories for segmentation.
   - Uncomment and run the call to `run_cellpose_segmentation()`.

4. **Data Interpretation and Visualization**
   - Set the directories for processed data and where to save the interpretation results.
   - Uncomment and run the call to `interpret_data()`.

5. **Merging Results**
   - Define experiment names and update directory paths.
   - Uncomment and run the call to `merge_results()`.

After adjusting the file paths and parameters to suit your data and environment, run the script:
```bash
python main.py
