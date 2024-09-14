clc, clear
close all

%% load data    
load('\suite2p\plane0\Fall.mat') % load activity data, exported by suite2p
load('\behavior_data.mat') % load stimuli stamp, column1:trial start stamp, column2:trial end stamp, column3: direction stamp(1-8)
N_idx = find(iscell(:,1)); % good neuron selected by suite2p
N_trace_raw = F(N_idx,:);
N_neutrace_raw = Fneu(N_idx,:);
N_trace = N_trace_raw - N_neutrace_raw*0.7;
V = stamp.bctrl_stamp(2:end,:);

%% Discriminate stimtype
% sort visual stamp orientation
for i = 1 :8
    V_stamp_ori_idx{i} = find(V(:,3) == (i-1)/8); V_stamp_ori{i} = V(V_stamp_ori_idx{i},:);
end
      
%% find responsed neuron of 8 grating orientations(campared to ITI baseline)
p_threshold=0.05;
post_stimulus_size = 60;
for i = 1 : 8
    trial_binsize = length(V_stamp_ori{i});
    [A_visual_evoked_matrix{i}, A_visual_evoked_neuron{i}] = find_stimulus_evoked_neurons_bintrial_tobaseline(N_trace, V_stamp_ori{i}(:,1), V_stamp_ori{i}(:,1), p_threshold, post_stimulus_size, trial_binsize);
end
A_visual_evoked_neuron_all = [];
for i = 1 : 8
    A_visual_evoked_neuron_all = union(A_visual_evoked_neuron_all,A_visual_evoked_neuron{i});
end

%% response neuron ratio
AP_visual_evoked_neuron_ratio = length(AP_visual_evoked_neuron_all)/length(N_idx);

%% calculate response peak dF/F0
% get response neuron dF/F0 trace matrix in trials and baseline F0
for i = 1 : length(V)
    temp_F0 = mean(N_trace(A_visual_evoked_neuron_all,(V(i,1)-30):(V(i,1)-1)),2);
    T_F0(:,i) = mean(N_trace_raw(A_visual_evoked_neuron_all,(V(i,1)-30):(V(i,1)-1)),2);
    T_dfF0_matrix(:,:,i) = (N_trace(A_visual_evoked_neuron_all,(V(i,1)-30):(V(i,1)+119))-temp_F0)./temp_F0;
end
T_F0_ave = mean(T_F0,2); % F0
% get tuning curve and prefered direction
for i = 1 : length(V_stamp_ori_idx)     
    T_dfF0_directions{i} = T_dfF0_matrix(:,:,V_stamp_ori_idx{i});
    T_dfF0_directions_ave{i} = mean(T_dfF0_directions{i},3);
    T_dfF0_directions_std{i} = std(T_dfF0_directions{i},0,3);
    T_dfF0_tuningcurve(:,i) = max(T_dfF0_directions_ave{i}(:,31:90),[],2);
end
T_dfF0_tuningcurve_wbase = [T_dfF0_tuningcurve mean(T_dfF0_directions_ave{i}(:,1:30),2)];
[T_dfF0_pref_amp,T_dfF0_pref_dir] = max(T_dfF0_tuningcurve,[],2); % prefered direction
% get peak dF/F0 and snr from prefered direction trials, get half-decay
[peak_dFF0,peak_snr,halfdecay_time] = calculate_peakdFF_snr_halfdecay(T_dfF0_directions_ave,A_visual_evoked_neuron_all,T_dfF0_pref_dir);





           