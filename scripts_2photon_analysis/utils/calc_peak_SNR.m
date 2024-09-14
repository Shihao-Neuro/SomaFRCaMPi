function [peak_SNR_list] = calc_peak_SNR(F_dff_cell)

    peak_SNR_list = [];
    for i = 1:length(F_dff_cell)
        F_dff = F_dff_cell{i};
        noise_std = std(F_dff, 0, 1);
        peak_SNR = max(F_dff, [], 1) ./ noise_std;
        SNR_dB = 10 * log10(peak_SNR);
        peak_SNR_list = [peak_SNR_list, SNR_dB];
    end
end

