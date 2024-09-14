function [peak_dFF] = calc_peak_dFF(F_dff_cell)

    peak_dFF = [];
    for i = 1:length(F_dff_cell)
        tmp_peak_dFF = max(F_dff_cell{i}, [], 1);
        peak_dFF = [peak_dFF, tmp_peak_dFF];
    end
end

