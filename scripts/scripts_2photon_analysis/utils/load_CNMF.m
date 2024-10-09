function [AIP_list, F_dff_list, S_list, A_data_list, A_indices_list, A_indptr_list] = load_CNMF(hdf5_files)
    AIP_list = {};
    F_dff_list = {};
    S_list = {};
    A_data_list = {};
    A_indices_list = {};
    A_indptr_list = {};
    for i = 1:length(hdf5_files)
        hdf5_file = hdf5_files{i};
        AIP = h5read(hdf5_file, "/estimates/AIP"); AIP = AIP';
        AIP_list{i} = AIP;
        F_dff_list{i} = h5read(hdf5_file, "/estimates/F_dff");
        S_list{i} = h5read(hdf5_file, "/estimates/S");
        A_data_list{i} = h5read(hdf5_file, "/estimates/A/data");
        A_indices_list{i} = h5read(hdf5_file, "/estimates/A/indices");
        A_indptr_list{i} = h5read(hdf5_file, "/estimates/A/indptr");
    end
end