function [good_signals, num_neurons_used] = find_isolated_signals(S, F_dff, min_interval)
    good_signals = [];
    num_neurons_used = 0;
    
    for nid = 1:size(S, 1)
        tmp_spikes = find(S(nid, :));
        if isempty(tmp_spikes)
            continue
        end
        
        good_spikes = extractNumbersBasedOnThreshold(tmp_spikes, min_interval, min_interval, size(S, 2)-min_interval);
        if ~isempty(good_spikes)
            num_neurons_used = num_neurons_used + 1;
        end
        for good_spike = good_spikes
            good_signals = [good_signals; F_dff(nid, good_spike-min_interval+1:good_spike+min_interval-1)];
        end
    end
end

