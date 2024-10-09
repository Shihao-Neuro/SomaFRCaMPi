%%
function [valid_id_matrix, valid_id_union] = find_stimulus_evoked_neurons_bintrial_tobaseline(N_spike, Trial_start_stamp, Sample_stamp, p_threshold, sample_size, trial_binsize)

valid_id_matrix = {};
valid_id_union = [];
trial_bin_n = fix(length(Trial_start_stamp)/trial_binsize);

for n = 1 : trial_bin_n
    valid_i = [];
    valid_p = [];
    trial_stamp_temp = [n*trial_binsize-trial_binsize+1 : n*trial_binsize];
    for i = 1 : size(N_spike, 1)
        if mod(i, 1000) == 0
            fprintf('processed %d/%d bin-trial %d/%d neurons \n', n, trial_bin_n, i, size(N_spike, 1))
        end
        curr_trace = N_spike(i, :);
        
        % isolate activities previous to stimulus and post to stimulus
        baseline_act = [];
        post_act = [];

        for k = 1 : trial_binsize
            kk=trial_stamp_temp(k);
            baseline_act(k, :) = curr_trace(Trial_start_stamp(kk)-sample_size : Trial_start_stamp(kk)-1);
            post_act(k, :) = curr_trace(Sample_stamp(kk): Sample_stamp(kk) + sample_size - 1);
        end
        
        % analysis tuning
        baseline_act_mean = mean(baseline_act, 2);
        post_act_mean = mean(post_act, 2);
        
        % hypothesis test
        p = signrank(baseline_act_mean, post_act_mean,'tail','left');
        if p < p_threshold 
            valid_i = [valid_i, i];
            valid_p = [valid_p, p];
        end
        
    end
    valid_id_matrix{n} = [valid_i;valid_p];
    if ~isempty(valid_id_matrix{n})
        valid_id_union = union(valid_id_union, valid_id_matrix{n}(1,:));
    end
end



