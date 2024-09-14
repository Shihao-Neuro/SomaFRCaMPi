function [good_signals, num_neurons_used] = find_isolated_signals_cell(week6_JR_S,week6_JR_F_dff, min_interval)
    good_signals = [];
    num_neurons_used = 0;
    for i = 1:length(week6_JR_S)
        [tmp_signals, tmp_neurons] = find_isolated_signals(week6_JR_S{i}', week6_JR_F_dff{i}', min_interval);
        good_signals = [good_signals; tmp_signals];
        num_neurons_used = num_neurons_used + tmp_neurons;
    end
end

