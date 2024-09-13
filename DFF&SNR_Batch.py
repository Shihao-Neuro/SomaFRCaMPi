import os
import pandas as pd
import numpy as np

# Set input path and output path
input_folder = r"C:\Users\Your Daddy\Documents\DFFbatchtest"
output_folder = r"C:\Users\Your Daddy\Documents\DFFbatchtest\result"
output_file = os.path.join(output_folder, "merged_results.xlsx")  # Output file path for the merged results

# Get all xlsx files in the input folder
xlsx_files = [file for file in os.listdir(input_folder) if file.endswith(".xlsx")]

# Create an ExcelWriter object for writing the merged results
writer = pd.ExcelWriter(output_file, engine='xlsxwriter')

# Create an empty DataFrame to save peak dF/F results
df_peakdff_result = pd.DataFrame()

# Create an empty DataFrame to save SNR results
df_snr_result = pd.DataFrame()

# Process each xlsx file
for file in xlsx_files:
    file_path = os.path.join(input_folder, file)
    file_name = os.path.splitext(file)[0]  # Extract file name (without extension)

    output_file_path1 = os.path.join(output_folder, f"{file_name}_dfftrace.xlsx")
    output_file_path2 = os.path.join(output_folder, f"{file_name}_dfftrace_nobaseline.xlsx")
    output_file_path3 = os.path.join(output_folder, f"{file_name}_peakdff.xlsx")
    output_file_path4 = os.path.join(output_folder, f"{file_name}_snr.xlsx")  # New result file path for SNR

    # Read Excel data
    df = pd.read_excel(file_path)

    # Get the columns that require DF/F calculation
    data_columns = df.columns[2:]

    # Create time column
    time_column1 = np.arange(0, len(df) * 0.05, 0.05)

    # Create an empty DataFrame to store DF/F results
    df_result = pd.DataFrame()

    # Create an empty DataFrame to store the maximum DF/F results
    df_max_result = pd.DataFrame(columns=data_columns)

    # Create an empty DataFrame to store SNR results
    df_snr_result_file = pd.DataFrame(columns=data_columns)

    # Calculate DF/F and maximum DF/F for each column
    for column in data_columns:
        data_column = df[column]

        # Calculate baseline (mean of the first 20 rows)
        baseline = data_column.iloc[:20].mean()

        # Calculate standard deviation of the first 20 rows
        std_dev = data_column.iloc[:20].std()

        # Calculate DF/F
        df_result[column] = (data_column - baseline) / baseline

        # Calculate maximum DF/F
        max_dff = df_result[column].max()
        df_max_result[column] = [max_dff]

        # Calculate SNR (signal-to-noise ratio)
        snr = (data_column.max() - baseline) / std_dev  # Modified SNR calculation formula
        df_snr_result_file[column] = [snr]

    # Merge time column and DF/F results
    result_df1 = pd.concat([df.iloc[:, 0], pd.Series(time_column1, name="Time [s]"), df_result], axis=1)

    # Save result 1 to an Excel file
    result_df1.to_excel(writer, sheet_name=f"{file_name}_dfftrace", index=False)

    # Remove the first 20 rows of data
    result_df2 = result_df1.iloc[20:].reset_index(drop=True)

    # Create a new time column (starting from 0, increasing by 0.05)
    time_column2 = np.arange(0, len(result_df2) * 0.05, 0.05)

    # Update the time column
    result_df2["Time [s]"] = time_column2

    # Save result 2 to a separate Excel file
    result_df2.to_excel(output_file_path2, index=False)

    # Merge maximum DF/F results
    df_peakdff_result = pd.concat([df_peakdff_result, df_max_result], axis=0)

    # Merge SNR results
    df_snr_result = pd.concat([df_snr_result, df_snr_result_file], axis=0)

    # Save other results to separate Excel files
    df_result.to_excel(output_file_path1, index=False)
    df_max_result.to_excel(output_file_path3, index=False)
    df_snr_result_file.to_excel(output_file_path4, index=False)

# Add file name column to the maximum DF/F results
df_peakdff_result.insert(0, "File Name", [os.path.splitext(file)[0] for file in xlsx_files])

# Add file name column to the SNR results
df_snr_result.insert(0, "File Name", [os.path.splitext(file)[0] for file in xlsx_files])

# Save maximum DF/F to the Excel file
df_peakdff_result.to_excel(writer, sheet_name="merged_peakdff", index=False)

# Save SNR to the Excel file
df_snr_result.to_excel(writer, sheet_name="merged_snr", index=False)

# Save and close the ExcelWriter
writer.save()
writer.close()
