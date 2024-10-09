%% Load data
% soma-localization
% 537_5 (Middle)
load('./data/one_photon/first_batch_no_denoising/537_5 middle processed/CNMF_E_results.mat')
V_537_5_middle = neuron; clear neuron;
% 537_5 (v 1.1)
load('./data/one_photon/first_batch_no_denoising/537_5 v 1.1 processed/CNMF_E_results.mat')
V_537_5_v = neuron; clear neuron;
% 537_6 (v)
load('./data/one_photon/first_batch_no_denoising/537_6 v processed/CNMF_E_results.mat')
V_537_6_v = neuron; clear neuron;
% 537_7 (Middle)
load('./data/one_photon/first_batch_no_denoising/537_7 middle processed/CNMF_E_results.mat')
V_537_7_middle = neuron; clear neuron;
% 537_7 (Top)
load('./data/one_photon/first_batch_no_denoising/537_7 top processed/CNMF_E_results.mat')
V_537_7_top = neuron; clear neuron;
% 537_7 (v)
load('./data/one_photon/first_batch_no_denoising/537_7 v processed/CNMF_E_results.mat')
V_537_7_v = neuron; clear neuron;

% cytoplasm expression
% 546_1 (Middle)
load('./data/one_photon/first_batch_no_denoising/546_1 middle 1.2 processed/CNMF_E_results.mat')
V_546_1_middle = neuron; clear neuron;
% 546_1 (v 1.1)
load('./data/one_photon/first_batch_no_denoising/546_1 v 1.1 processed/CNMF_E_results.mat')
V_546_1_v = neuron; clear neuron;
% 546_2 (Middle)
load('./data/one_photon/first_batch_no_denoising/546_2 middle processed/CNMF_E_results.mat')
V_546_2_middle = neuron; clear neuron;
% 546_2 (Top)
load('./data/one_photon/first_batch_no_denoising/546_2 top processed/CNMF_E_results.mat')
V_546_2_top = neuron; clear neuron;
% 546_2 (v)
load('./data/one_photon/first_batch_no_denoising/546_2 v processed/CNMF_E_results.mat')
V_546_2_v = neuron; clear neuron;
% 546_3 (Middle 1.2(MO-RSP))
load('./data/one_photon/first_batch_no_denoising/546_2 middle 1.2(MO-RSP) processed/CNMF_E_results.mat')
V_546_3_middle = neuron; clear neuron;
% 546_3 (near v (RSP))
load('./data/one_photon/first_batch_no_denoising/546_3 near v (RSP) processed/CNMF_E_results.mat')
V_546_3_v = neuron; clear neuron;

% load second batch data

% soma-localization
% 537_4 (left_01)
load('/home/minho/Documents/SomaFRCaMPi/data/one_photon/second_batch_after_denoising/537_4_left_01_4x4_source_extraction/CNMF_E_results.mat')
W_537_4_left_01 = neuron; clear neuron;
% 537_4 (left_02)
load('/home/minho/Documents/SomaFRCaMPi/data/one_photon/second_batch_after_denoising/537_4_left_02 ok_4x4_source_extraction/CNMF_E_results.mat')
W_537_4_left_02 = neuron; clear neuron;
% 537_4 (s1_01)
load('/home/minho/Documents/SomaFRCaMPi/data/one_photon/second_batch_after_denoising/537_4_s1_01_4x4_source_extraction/CNMF_E_results.mat')
W_537_4_s1_01 = neuron; clear neuron;
% 537_8 (01)
load('/home/minho/Documents/SomaFRCaMPi/data/one_photon/second_batch_after_denoising/537_08_01_4x4_source_extraction/CNMF_E_results.mat')
W_537_8_01 = neuron; clear neuron;
% 537_8 (02)
load('/home/minho/Documents/SomaFRCaMPi/data/one_photon/second_batch_after_denoising/537_08_02_4x4_source_extraction/CNMF_E_results.mat')
W_537_8_02 = neuron; clear neuron;
% 537_8 (03)
load('/home/minho/Documents/SomaFRCaMPi/data/one_photon/second_batch_after_denoising/537_08_03(fewer)_4x4_source_extraction/CNMF_E_results.mat')
W_537_8_03 = neuron; clear neuron;

% cytoplasm expression
% 546_5 (01ssp)
load('/home/minho/Documents/SomaFRCaMPi/data/one_photon/second_batch_after_denoising/546_5_01ssp_4x4_source_extraction/CNMF_E_results.mat')
W_546_5_01 = neuron; clear neuron;
% 546_5 (02vis)
load('/home/minho/Documents/SomaFRCaMPi/data/one_photon/second_batch_after_denoising/546_5_02vis_4x4_source_extraction/CNMF_E_results.mat')
W_546_5_02 = neuron; clear neuron;
% 546_5 (03ssp)
load('/home/minho/Documents/SomaFRCaMPi/data/one_photon/second_batch_after_denoising/546_5_03ssp_4x4_source_extraction/CNMF_E_results.mat')
W_546_5_03 = neuron; clear neuron;
% 546_6 (01ssp)
load('/home/minho/Documents/SomaFRCaMPi/data/one_photon/second_batch_after_denoising/546_6_01ssp_4x4_source_extraction/CNMF_E_results.mat')
W_546_6_01 = neuron; clear neuron;
% 546_8 (01sspagain)
load('/home/minho/Documents/SomaFRCaMPi/data/one_photon/second_batch_after_denoising/546_8_01sspagain_4x4_source_extraction/CNMF_E_results.mat')
W_546_8_01 = neuron; clear neuron;
% 546_8 (02vis)
load('/home/minho/Documents/SomaFRCaMPi/data/one_photon/second_batch_after_denoising/546_8_02vis_4x4_source_extraction/CNMF_E_results.mat')
W_546_8_02 = neuron; clear neuron;
% 546_9 (01ssp)
load('/home/minho/Documents/SomaFRCaMPi/data/one_photon/second_batch_after_denoising/546_9_01ssp_4x4_source_extraction/CNMF_E_results.mat')
W_546_9_01 = neuron; clear neuron;


%% Panel d (sample trace and spike event trace)
min_interval = 40; % in frames (there need to be no spikes before and after this period)

good_signals_SSP_soma = [];

for nid = 1:size(V_537_5_middle.S, 1)
    tmp_spikes = find(V_537_5_middle.S(nid, :));
    if isempty(tmp_spikes)
        continue
    end
    good_spikes = extractNumbersBasedOnThreshold(tmp_spikes, min_interval, min_interval, size(V_537_5_middle.S, 2)-min_interval);
    for good_spike = good_spikes
        good_signals_SSP_soma = [good_signals_SSP_soma; V_537_5_middle.C_raw(nid, good_spike-min_interval+1:good_spike+min_interval-1)];
    end
end
for nid = 1:size(V_537_7_middle.S, 1)
    tmp_spikes = find(V_537_7_middle.S(nid, :));
    if isempty(tmp_spikes)
        continue
    end
    good_spikes = extractNumbersBasedOnThreshold(tmp_spikes, min_interval, min_interval, size(V_537_7_middle.S, 2)-min_interval);
    for good_spike = good_spikes
        good_signals_SSP_soma = [good_signals_SSP_soma; V_537_7_middle.C_raw(nid, good_spike-min_interval+1:good_spike+min_interval-1)];
    end
end
for nid = 1:size(W_537_4_left_01.S, 1)
    tmp_spikes = find(W_537_4_left_01.S(nid, :));
    if isempty(tmp_spikes)
        continue
    end
    good_spikes = extractNumbersBasedOnThreshold(tmp_spikes, min_interval, min_interval, size(W_537_4_left_01.S, 2)-min_interval);
    for good_spike = good_spikes
        good_signals_SSP_soma = [good_signals_SSP_soma; W_537_4_left_01.C_raw(nid, good_spike-min_interval+1:good_spike+min_interval-1)];
    end
end
for nid = 1:size(W_537_4_left_02.S, 1)
    tmp_spikes = find(W_537_4_left_02.S(nid, :));
    if isempty(tmp_spikes)
        continue
    end
    good_spikes = extractNumbersBasedOnThreshold(tmp_spikes, min_interval, min_interval, size(W_537_4_left_02.S, 2)-min_interval);
    for good_spike = good_spikes
        good_signals_SSP_soma = [good_signals_SSP_soma; W_537_4_left_02.C_raw(nid, good_spike-min_interval+1:good_spike+min_interval-1)];
    end
end
for nid = 1:size(W_537_8_01.S, 1)
    tmp_spikes = find(W_537_8_01.S(nid, :));
    if isempty(tmp_spikes)
        continue
    end
    good_spikes = extractNumbersBasedOnThreshold(tmp_spikes, min_interval, min_interval, size(W_537_8_01.S, 2)-min_interval);
    for good_spike = good_spikes
        good_signals_SSP_soma = [good_signals_SSP_soma; W_537_8_01.C_raw(nid, good_spike-min_interval+1:good_spike+min_interval-1)];
    end
end
for nid = 1:size(W_537_8_03.S, 1)
    tmp_spikes = find(W_537_8_03.S(nid, :));
    if isempty(tmp_spikes)
        continue
    end
    good_spikes = extractNumbersBasedOnThreshold(tmp_spikes, min_interval, min_interval, size(W_537_8_03.S, 2)-min_interval);
    for good_spike = good_spikes
        good_signals_SSP_soma = [good_signals_SSP_soma; W_537_8_03.C_raw(nid, good_spike-min_interval+1:good_spike+min_interval-1)];
    end
end

good_signals_SSP_cyto = [];

for nid = 1:size(V_546_1_middle.S, 1)
    tmp_spikes = find(V_546_1_middle.S(nid, :));
    if isempty(tmp_spikes)
        continue
    end
    good_spikes = extractNumbersBasedOnThreshold(tmp_spikes, min_interval, min_interval, size(V_546_1_middle.S, 2)-min_interval);
    for good_spike = good_spikes
        good_signals_SSP_cyto = [good_signals_SSP_cyto; V_546_1_middle.C_raw(nid, good_spike-min_interval+1:good_spike+min_interval-1)];
    end
end
for nid = 1:size(W_546_5_01.S, 1)
    tmp_spikes = find(W_546_5_01.S(nid, :));
    if isempty(tmp_spikes)
        continue
    end
    good_spikes = extractNumbersBasedOnThreshold(tmp_spikes, min_interval, min_interval, size(W_546_5_01.S, 2)-min_interval);
    for good_spike = good_spikes
        good_signals_SSP_cyto = [good_signals_SSP_cyto; W_546_5_01.C_raw(nid, good_spike-min_interval+1:good_spike+min_interval-1)];
    end
end
for nid = 1:size(W_546_5_03.S, 1)
    tmp_spikes = find(W_546_5_03.S(nid, :));
    if isempty(tmp_spikes)
        continue
    end
    good_spikes = extractNumbersBasedOnThreshold(tmp_spikes, min_interval, min_interval, size(W_546_5_03.S, 2)-min_interval);
    for good_spike = good_spikes
        good_signals_SSP_cyto = [good_signals_SSP_cyto; W_546_5_03.C_raw(nid, good_spike-min_interval+1:good_spike+min_interval-1)];
    end
end
for nid = 1:size(W_546_6_01.S, 1)
    tmp_spikes = find(W_546_6_01.S(nid, :));
    if isempty(tmp_spikes)
        continue
    end
    good_spikes = extractNumbersBasedOnThreshold(tmp_spikes, min_interval, min_interval, size(W_546_6_01.S, 2)-min_interval);
    for good_spike = good_spikes
        good_signals_SSP_cyto = [good_signals_SSP_cyto; W_546_6_01.C_raw(nid, good_spike-min_interval+1:good_spike+min_interval-1)];
    end
end
for nid = 1:size(W_546_9_01.S, 1)
    tmp_spikes = find(W_546_9_01.S(nid, :));
    if isempty(tmp_spikes)
        continue
    end
    good_spikes = extractNumbersBasedOnThreshold(tmp_spikes, min_interval, min_interval, size(W_546_9_01.S, 2)-min_interval);
    for good_spike = good_spikes
        good_signals_SSP_cyto = [good_signals_SSP_cyto; W_546_9_01.C_raw(nid, good_spike-min_interval+1:good_spike+min_interval-1)];
    end
end


good_signals_VIS_soma = [];

for nid = 1:size(V_537_5_v.S, 1)
    tmp_spikes = find(V_537_5_v.S(nid, :));
    if isempty(tmp_spikes)
        continue
    end
    good_spikes = extractNumbersBasedOnThreshold(tmp_spikes, min_interval, min_interval, size(V_537_5_v.S, 2)-min_interval);
    for good_spike = good_spikes
        good_signals_VIS_soma = [good_signals_VIS_soma; V_537_5_v.C_raw(nid, good_spike-min_interval+1:good_spike+min_interval-1)];
    end
end
for nid = 1:size(V_537_6_v.S, 1)
    tmp_spikes = find(V_537_6_v.S(nid, :));
    if isempty(tmp_spikes)
        continue
    end
    good_spikes = extractNumbersBasedOnThreshold(tmp_spikes, min_interval, min_interval, size(V_537_6_v.S, 2)-min_interval);
    for good_spike = good_spikes
        good_signals_VIS_soma = [good_signals_VIS_soma; V_537_6_v.C_raw(nid, good_spike-min_interval+1:good_spike+min_interval-1)];
    end
end
for nid = 1:size(V_537_7_v.S, 1)
    tmp_spikes = find(V_537_7_v.S(nid, :));
    if isempty(tmp_spikes)
        continue
    end
    good_spikes = extractNumbersBasedOnThreshold(tmp_spikes, min_interval, min_interval, size(V_537_7_v.S, 2)-min_interval);
    for good_spike = good_spikes
        good_signals_VIS_soma = [good_signals_VIS_soma; V_537_7_v.C_raw(nid, good_spike-min_interval+1:good_spike+min_interval-1)];
    end
end
for nid = 1:size(W_537_4_s1_01.S, 1)
    tmp_spikes = find(W_537_4_s1_01.S(nid, :));
    if isempty(tmp_spikes)
        continue
    end
    good_spikes = extractNumbersBasedOnThreshold(tmp_spikes, min_interval, min_interval, size(W_537_4_s1_01.S, 2)-min_interval);
    for good_spike = good_spikes
        good_signals_VIS_soma = [good_signals_VIS_soma; W_537_4_s1_01.C_raw(nid, good_spike-min_interval+1:good_spike+min_interval-1)];
    end
end
for nid = 1:size(W_537_8_02.S, 1)
    tmp_spikes = find(W_537_8_02.S(nid, :));
    if isempty(tmp_spikes)
        continue
    end
    good_spikes = extractNumbersBasedOnThreshold(tmp_spikes, min_interval, min_interval, size(W_537_8_02.S, 2)-min_interval);
    for good_spike = good_spikes
        good_signals_VIS_soma = [good_signals_VIS_soma; W_537_8_02.C_raw(nid, good_spike-min_interval+1:good_spike+min_interval-1)];
    end
end


good_signals_VIS_cyto = [];

for nid = 1:size(V_546_1_v.S, 1)
    tmp_spikes = find(V_546_1_v.S(nid, :));
    if isempty(tmp_spikes)
        continue
    end
    good_spikes = extractNumbersBasedOnThreshold(tmp_spikes, min_interval, min_interval, size(V_546_1_v.S, 2)-min_interval);
    for good_spike = good_spikes
        good_signals_VIS_cyto = [good_signals_VIS_cyto; V_546_1_v.C_raw(nid, good_spike-min_interval+1:good_spike+min_interval-1)];
    end
end
for nid = 1:size(W_546_5_02.S, 1)
    tmp_spikes = find(W_546_5_02.S(nid, :));
    if isempty(tmp_spikes)
        continue
    end
    good_spikes = extractNumbersBasedOnThreshold(tmp_spikes, min_interval, min_interval, size(W_546_5_02.S, 2)-min_interval);
    for good_spike = good_spikes
        good_signals_VIS_cyto = [good_signals_VIS_cyto; W_546_5_02.C_raw(nid, good_spike-min_interval+1:good_spike+min_interval-1)];
    end
end
for nid = 1:size(W_546_8_02.S, 1)
    tmp_spikes = find(W_546_8_02.S(nid, :));
    if isempty(tmp_spikes)
        continue
    end
    good_spikes = extractNumbersBasedOnThreshold(tmp_spikes, min_interval, min_interval, size(W_546_8_02.S, 2)-min_interval);
    for good_spike = good_spikes
        good_signals_VIS_cyto = [good_signals_VIS_cyto; W_546_8_02.C_raw(nid, good_spike-min_interval+1:good_spike+min_interval-1)];
    end
end

figure;
subplot(1,2,1); 
meanSignal = mean([good_signals_SSP_soma; good_signals_VIS_soma], 1);
stdSignal = std([good_signals_SSP_soma; good_signals_VIS_soma], 0, 1);
time = 1:79;
plot(time, meanSignal, 'k', 'LineWidth', 2); % 'k' for black line
hold on;
upperShade = meanSignal + stdSignal;
lowerShade = meanSignal - stdSignal;
fill([time, fliplr(time)], [upperShade, fliplr(lowerShade)], 'k', 'FaceAlpha', 0.1, 'EdgeColor', 'none');
ylim([-0.5, 2.5]);
ylabel('dFF');
xlabel('time [frame]');
title('soma (SSP + VIS)');

subplot(1,2,2); 
meanSignal = mean([good_signals_SSP_cyto; good_signals_VIS_cyto], 1);
stdSignal = std([good_signals_SSP_cyto; good_signals_VIS_cyto], 0, 1);
time = 1:79;
plot(time, meanSignal, 'k', 'LineWidth', 2); % 'k' for black line
hold on;
upperShade = meanSignal + stdSignal;
lowerShade = meanSignal - stdSignal;
fill([time, fliplr(time)], [upperShade, fliplr(lowerShade)], 'k', 'FaceAlpha', 0.1, 'EdgeColor', 'none');
ylim([-0.5, 2.5]);
xlabel('time [frame]');
title('cyto (SSP + VIS)');

%% Panel e (spike rate)
% SSP
spike_rate_SSP_soma = [];
spike_rate_SSP_soma = [spike_rate_SSP_soma, (sum(full(V_537_5_middle.S) > 0, 2) ./ (0.075 * 500))'];
spike_rate_SSP_soma = [spike_rate_SSP_soma, (sum(full(V_537_7_middle.S) > 0, 2) ./ (0.075 * 500))'];
spike_rate_SSP_soma = [spike_rate_SSP_soma, (sum(full(W_537_4_left_01.S) > 0, 2) ./ (0.075 * 500))'];
spike_rate_SSP_soma = [spike_rate_SSP_soma, (sum(full(W_537_4_left_02.S) > 0, 2) ./ (0.075 * 500))'];
spike_rate_SSP_soma = [spike_rate_SSP_soma, (sum(full(W_537_8_01.S) > 0, 2) ./ (0.075 * 500))'];
spike_rate_SSP_soma = [spike_rate_SSP_soma, (sum(full(W_537_8_03.S) > 0, 2) ./ (0.075 * 500))'];

spike_rate_SSP_cyto = [];
spike_rate_SSP_cyto = [spike_rate_SSP_cyto, (sum(full(V_546_1_middle.S) > 0, 2) ./ (0.075 * 500))'];
spike_rate_SSP_cyto = [spike_rate_SSP_cyto, (sum(full(W_546_5_01.S) > 0, 2) ./ (0.075 * 500))'];
spike_rate_SSP_cyto = [spike_rate_SSP_cyto, (sum(full(W_546_5_03.S) > 0, 2) ./ (0.075 * 500))'];
spike_rate_SSP_cyto = [spike_rate_SSP_cyto, (sum(full(W_546_6_01.S) > 0, 2) ./ (0.075 * 500))'];
spike_rate_SSP_cyto = [spike_rate_SSP_cyto, (sum(full(W_546_9_01.S) > 0, 2) ./ (0.075 * 500))'];

[h, p] = ttest2(spike_rate_SSP_soma, spike_rate_SSP_cyto);

figure;
subplot(1,2,1);
mean_data = [mean(spike_rate_SSP_soma), mean(spike_rate_SSP_cyto)];
std_data = [std(spike_rate_SSP_soma), std(spike_rate_SSP_cyto)];
bar(mean_data, 'b'); % 'b' specifies blue bars
hold on; % Keeps the bar plot visible while we add the error bars
errorbar(1:2, mean_data, std_data, '.k'); % '.k' specifies black dots for the error bars
ylim([0, 0.14]);
ylabel('spike rate');
xticklabels({'soma', 'cyto'});
title(['SSP (p-value: ', num2str(p), ')']);

% VIS
spike_rate_VIS_soma = [];
spike_rate_VIS_soma = [spike_rate_VIS_soma, (sum(full(V_537_5_v.S) > 0, 2) ./ (0.075 * 500))'];
spike_rate_VIS_soma = [spike_rate_VIS_soma, (sum(full(V_537_6_v.S) > 0, 2) ./ (0.075 * 500))'];
spike_rate_VIS_soma = [spike_rate_VIS_soma, (sum(full(V_537_7_v.S) > 0, 2) ./ (0.075 * 500))'];
spike_rate_VIS_soma = [spike_rate_VIS_soma, (sum(full(W_537_4_s1_01.S) > 0, 2) ./ (0.075 * 500))'];
spike_rate_VIS_soma = [spike_rate_VIS_soma, (sum(full(W_537_8_02.S) > 0, 2) ./ (0.075 * 500))'];

spike_rate_VIS_cyto = [];
spike_rate_VIS_cyto = [spike_rate_VIS_cyto, (sum(full(V_546_1_v.S) > 0, 2) ./ (0.075 * 500))'];
spike_rate_VIS_cyto = [spike_rate_VIS_cyto, (sum(full(W_546_5_02.S) > 0, 2) ./ (0.075 * 500))'];
spike_rate_VIS_cyto = [spike_rate_VIS_cyto, (sum(full(W_546_8_02.S) > 0, 2) ./ (0.075 * 500))'];

[h, p] = ttest2(spike_rate_VIS_soma, spike_rate_VIS_cyto);

subplot(1,2,2);
mean_data = [mean(spike_rate_VIS_soma), mean(spike_rate_VIS_cyto)];
std_data = [std(spike_rate_VIS_soma), std(spike_rate_VIS_cyto)];
bar(mean_data, 'b'); % 'b' specifies blue bars
hold on; % Keeps the bar plot visible while we add the error bars
errorbar(1:2, mean_data, std_data, '.k'); % '.k' specifies black dots for the error bars
ylim([0, 0.14]);
xticklabels({'soma', 'cyto'});
title(['SSP (p-value: ', num2str(p), ')']);

%% Panel f (PCC image)
% SSP
SSP_soma_file_list = {'V_537_5_middle.mat', 'V_537_7_middle.mat', 'W_537_4_left_01.mat', 'W_537_4_left_02.mat', 'W_537_8_01.mat', 'W_537_8_03.mat'};
SSP_cyto_file_list = {'V_546_1_middle.mat', 'W_546_5_01.mat', 'W_546_5_03.mat', 'W_546_6_01.mat', 'W_546_9_01.mat'};
SSP_soma_l2_distance_list = [];
SSP_soma_corr_list = [];
SSP_cyto_l2_distance_list = [];
SSP_cyto_corr_list = [];
for soma_file_idx = 1:length(SSP_soma_file_list)
    load(['raw_trace_corr\', SSP_soma_file_list{soma_file_idx}]);
    SSP_soma_l2_distance_list = [SSP_soma_l2_distance_list, l2_distance_list*0.52];
    SSP_soma_corr_list = [SSP_soma_corr_list, corr_list];
end
for cyto_file_idx = 1:length(SSP_cyto_file_list)
    load(['raw_trace_corr\', SSP_cyto_file_list{cyto_file_idx}]);
    SSP_cyto_l2_distance_list = [SSP_cyto_l2_distance_list, l2_distance_list*0.52];
    SSP_cyto_corr_list = [SSP_cyto_corr_list, corr_list];
end

figure;
subplot(1,2,1);
Xedges = [0:5:300];
Yedges = [0.4:0.01:1];
histogram2(SSP_soma_l2_distance_list',SSP_soma_corr_list',Xedges, Yedges,'DisplayStyle','tile','ShowEmptyBins','on');
xlabel('Distance between cell pairs (micrometer)')
ylabel('Pearson correlation coefficients')
colormap('hot');
colorbar
view(2)

subplot(1,2,2);
Xedges = [0:5:300];
Yedges = [0.4:0.01:1];
histogram2(SSP_cyto_l2_distance_list',SSP_cyto_corr_list',Xedges, Yedges,'DisplayStyle','tile','ShowEmptyBins','on');
xlabel('Distance between cell pairs (micrometer)')
ylabel('Pearson correlation coefficients')
colorbar
view(2)
sgtitle('SSP')

% VIS
VIS_soma_file_list = {'V_537_5_v.mat', 'V_537_6_v.mat', 'V_537_7_v.mat', 'W_537_4_s1_01.mat', 'W_537_8_02.mat'};
VIS_cyto_file_list = {'V_546_1_v.mat', 'W_546_5_02.mat', 'W_546_8_02.mat'};
VIS_soma_l2_distance_list = [];
VIS_soma_corr_list = [];
VIS_cyto_l2_distance_list = [];
VIS_cyto_corr_list = [];
for soma_file_idx = 1:length(VIS_soma_file_list)
    load(['raw_trace_corr\', VIS_soma_file_list{soma_file_idx}]);
    VIS_soma_l2_distance_list = [VIS_soma_l2_distance_list, l2_distance_list*0.52];
    VIS_soma_corr_list = [VIS_soma_corr_list, corr_list];
end
for cyto_file_idx = 1:length(VIS_cyto_file_list)
    load(['raw_trace_corr\', VIS_cyto_file_list{cyto_file_idx}]);
    VIS_cyto_l2_distance_list = [VIS_cyto_l2_distance_list, l2_distance_list*0.52];
    VIS_cyto_corr_list = [VIS_cyto_corr_list, corr_list];
end

figure;
subplot(1,2,1);
Xedges = [0:6:300];
Yedges = [0.5:0.01:1];
histogram2(VIS_soma_l2_distance_list',VIS_soma_corr_list',Xedges, Yedges,'DisplayStyle','tile','ShowEmptyBins','on');
xlabel('Distance between cell pairs (micrometer)')
ylabel('Pearson correlation coefficients')
colormap('hot');
colorbar
view(2)

subplot(1,2,2);
Xedges = [0:6:300];
Yedges = [0.5:0.01:1];
histogram2(VIS_cyto_l2_distance_list',VIS_cyto_corr_list',Xedges, Yedges,'DisplayStyle','tile','ShowEmptyBins','on');
xlabel('Distance between cell pairs (micrometer)')
ylabel('Pearson correlation coefficients')
colorbar
view(2)
sgtitle('VIS');

%% Panel g (PCC plot)
figure;
subplot(1,2,1);
mean_data = [mean(SSP_soma_corr_list), mean(SSP_cyto_corr_list)];
std_data = [std(SSP_soma_corr_list), std(SSP_cyto_corr_list)];
bar(mean_data, 'b'); % 'b' specifies blue bars
hold on; % Keeps the bar plot visible while we add the error bars
errorbar(1:2, mean_data, std_data, '.k'); % '.k' specifies black dots for the error bars
ylim([0.6, 1])
ylabel('PCC');
[~, p] = ttest2(SSP_soma_corr_list, SSP_cyto_corr_list);
xticklabels({'soma', 'cyto'});
title(['SSP (p-value: ', num2str(p), ')']);

subplot(1,2,2);
mean_data = [mean(VIS_soma_corr_list), mean(VIS_cyto_corr_list)];
std_data = [std(VIS_soma_corr_list), std(VIS_cyto_corr_list)];
bar(mean_data, 'b'); % 'b' specifies blue bars
hold on; % Keeps the bar plot visible while we add the error bars
errorbar(1:2, mean_data, std_data, '.k'); % '.k' specifies black dots for the error bars
ylim([0.6, 1])
[~, p] = ttest2(VIS_soma_corr_list, VIS_cyto_corr_list);
xticklabels({'soma', 'cyto'});
title(['VIS (p-value: ', num2str(p), ')']);

%% Panel h (peak dFF)
% SSP
SSP_soma_dff_max = [];
SSP_soma_dff_max = [SSP_soma_dff_max, max(V_537_5_middle.C_raw, [], 2)'];
SSP_soma_dff_max = [SSP_soma_dff_max, max(V_537_7_middle.C_raw, [], 2)'];
SSP_soma_dff_max = [SSP_soma_dff_max, max(W_537_4_left_01.C_raw, [], 2)'];
SSP_soma_dff_max = [SSP_soma_dff_max, max(W_537_4_left_02.C_raw, [], 2)'];
SSP_soma_dff_max = [SSP_soma_dff_max, max(W_537_8_01.C_raw, [], 2)'];
SSP_soma_dff_max = [SSP_soma_dff_max, max(W_537_8_03.C_raw, [], 2)'];

SSP_cyto_dff_max = [];
SSP_cyto_dff_max = [SSP_cyto_dff_max, max(V_546_1_middle.C_raw, [], 2)'];
SSP_cyto_dff_max = [SSP_cyto_dff_max, max(W_546_5_01.C_raw, [], 2)'];
SSP_cyto_dff_max = [SSP_cyto_dff_max, max(W_546_5_03.C_raw, [], 2)'];
SSP_cyto_dff_max = [SSP_cyto_dff_max, max(W_546_6_01.C_raw, [], 2)'];
SSP_cyto_dff_max = [SSP_cyto_dff_max, max(W_546_9_01.C_raw, [], 2)'];


% VIS
VIS_soma_dff_max = [];
VIS_soma_dff_max = [VIS_soma_dff_max, max(V_537_5_v.C_raw, [], 2)'];
VIS_soma_dff_max = [VIS_soma_dff_max, max(V_537_6_v.C_raw, [], 2)'];
VIS_soma_dff_max = [VIS_soma_dff_max, max(V_537_7_v.C_raw, [], 2)'];
VIS_soma_dff_max = [VIS_soma_dff_max, max(W_537_4_s1_01.C_raw, [], 2)'];
VIS_soma_dff_max = [VIS_soma_dff_max, max(W_537_8_02.C_raw, [], 2)'];

VIS_cyto_dff_max = [];
VIS_cyto_dff_max = [VIS_cyto_dff_max, max(V_546_1_v.C_raw, [], 2)'];
VIS_cyto_dff_max = [VIS_cyto_dff_max, max(W_546_5_02.C_raw, [], 2)'];
VIS_cyto_dff_max = [VIS_cyto_dff_max, max(W_546_8_02.C_raw, [], 2)'];

num_neurons_total = [SSP_soma_dff_max'; SSP_cyto_dff_max'];
g1 = repmat({'Soma-localized'},length(SSP_soma_dff_max),1);
g2 = repmat({'Cytosolic'},length(SSP_cyto_dff_max),1);
g = [g1; g2];
figure; subplot(1,2,1);
boxplot(num_neurons_total,g); %ylim([0, 500]);
ylim([0, 35]);
ylabel('Peak dFF');
title('SSP');
[~, p] = ttest2(SSP_soma_dff_max, SSP_cyto_dff_max);
title(['SSP (p-value: ', num2str(p), ')']);

num_neurons_total = [VIS_soma_dff_max'; VIS_cyto_dff_max'];
g1 = repmat({'Soma-localized'},length(VIS_soma_dff_max),1);
g2 = repmat({'Cytosolic'},length(VIS_cyto_dff_max),1);
g = [g1; g2];
subplot(1,2,2);
boxplot(num_neurons_total,g); %ylim([0, 500]);
ylim([0, 35]);
title('VIS');
[~, p] = ttest2(VIS_soma_dff_max, VIS_cyto_dff_max);
title(['VIS (p-value: ', num2str(p), ')']);

% bar plot
figure;
subplot(1,2,1);
mean_data = [mean(SSP_soma_dff_max), mean(SSP_cyto_dff_max)];
std_data = [std(SSP_soma_dff_max), std(SSP_cyto_dff_max)];
bar(mean_data, 'b'); % 'b' specifies blue bars
hold on; % Keeps the bar plot visible while we add the error bars
errorbar(1:2, mean_data, std_data, '.k'); % '.k' specifies black dots for the error bars
% ylim([-1, 4.0]);
ylabel('Peak dFF');
xticklabels({'soma', 'cyto'});
[~, p] = ttest2(SSP_soma_dff_max, SSP_cyto_dff_max);
title(['SSP (p-value: ', num2str(p), ')']);

subplot(1,2,2);
mean_data = [mean(VIS_soma_dff_max), mean(VIS_cyto_dff_max)];
std_data = [std(VIS_soma_dff_max), std(VIS_cyto_dff_max)];
bar(mean_data, 'b'); % 'b' specifies blue bars
hold on; % Keeps the bar plot visible while we add the error bars
errorbar(1:2, mean_data, std_data, '.k'); % '.k' specifies black dots for the error bars
% ylim([-1, 4.0]);
xticklabels({'soma', 'cyto'});
[~, p] = ttest2(VIS_soma_dff_max, VIS_cyto_dff_max);
title(['VIS (p-value: ', num2str(p), ')']);

%% Panel i (peak SNR)
% SSP
SSP_soma_SNR_max = [];
SSP_soma_SNR_max = [SSP_soma_SNR_max, (max(V_537_5_middle.C_raw, [], 2) ./ (2 * std(V_537_5_middle.C_raw < 0, 0, 2)))'];
SSP_soma_SNR_max = [SSP_soma_SNR_max, (max(V_537_7_middle.C_raw, [], 2) ./ (2 * std(V_537_7_middle.C_raw < 0, 0, 2)))'];
SSP_soma_SNR_max = [SSP_soma_SNR_max, (max(W_537_4_left_01.C_raw, [], 2) ./ (2 * std(W_537_4_left_01.C_raw < 0, 0, 2)))'];
SSP_soma_SNR_max = [SSP_soma_SNR_max, (max(W_537_4_left_02.C_raw, [], 2) ./ (2 * std(W_537_4_left_02.C_raw < 0, 0, 2)))'];
SSP_soma_SNR_max = [SSP_soma_SNR_max, (max(W_537_8_01.C_raw, [], 2) ./ (2 * std(W_537_8_01.C_raw < 0, 0, 2)))'];
SSP_soma_SNR_max = [SSP_soma_SNR_max, (max(W_537_8_03.C_raw, [], 2) ./ (2 * std(W_537_8_03.C_raw < 0, 0, 2)))'];
% SSP_soma_SNR_max = 10 * log10(SSP_soma_SNR_max);

SSP_cyto_SNR_max = [];
SSP_cyto_SNR_max = [SSP_cyto_SNR_max, (max(V_546_1_middle.C_raw, [], 2) ./ (2 * std(V_546_1_middle.C_raw < 0, 0, 2)))'];
SSP_cyto_SNR_max = [SSP_cyto_SNR_max, (max(W_546_5_01.C_raw, [], 2) ./ (2 * std(W_546_5_01.C_raw < 0, 0, 2)))'];
SSP_cyto_SNR_max = [SSP_cyto_SNR_max, (max(W_546_5_03.C_raw, [], 2) ./ (2 * std(W_546_5_03.C_raw < 0, 0, 2)))'];
SSP_cyto_SNR_max = [SSP_cyto_SNR_max, (max(W_546_6_01.C_raw, [], 2) ./ (2 * std(W_546_6_01.C_raw < 0, 0, 2)))'];
SSP_cyto_SNR_max = [SSP_cyto_SNR_max, (max(W_546_9_01.C_raw, [], 2) ./ (2 * std(W_546_9_01.C_raw < 0, 0, 2)))'];
% SSP_cyto_SNR_max = 10 * log10(SSP_cyto_SNR_max);


% VIS
VIS_soma_SNR_max = [];
VIS_soma_SNR_max = [VIS_soma_SNR_max, (max(V_537_5_v.C_raw, [], 2) ./ (2 * std(V_537_5_v.C_raw < 0, 0, 2)))'];
VIS_soma_SNR_max = [VIS_soma_SNR_max, (max(V_537_6_v.C_raw, [], 2) ./ (2 * std(V_537_6_v.C_raw < 0, 0, 2)))'];
VIS_soma_SNR_max = [VIS_soma_SNR_max, (max(V_537_7_v.C_raw, [], 2) ./ (2 * std(V_537_7_v.C_raw < 0, 0, 2)))'];
VIS_soma_SNR_max = [VIS_soma_SNR_max, (max(W_537_4_s1_01.C_raw, [], 2) ./ (2 * std(W_537_4_s1_01.C_raw < 0, 0, 2)))'];
VIS_soma_SNR_max = [VIS_soma_SNR_max, (max(W_537_8_02.C_raw, [], 2) ./ (2 * std(W_537_8_02.C_raw < 0, 0, 2)))'];
% VIS_soma_SNR_max = 10 * log10(VIS_soma_SNR_max);

VIS_cyto_SNR_max = [];
VIS_cyto_SNR_max = [VIS_cyto_SNR_max, (max(V_546_1_v.C_raw, [], 2) ./ (2 * std(V_546_1_v.C_raw < 0, 0, 2)))'];
VIS_cyto_SNR_max = [VIS_cyto_SNR_max, (max(W_546_5_02.C_raw, [], 2) ./ (2 * std(W_546_5_02.C_raw < 0, 0, 2)))'];
VIS_cyto_SNR_max = [VIS_cyto_SNR_max, (max(W_546_8_02.C_raw, [], 2) ./ (2 * std(W_546_8_02.C_raw < 0, 0, 2)))'];
% VIS_cyto_SNR_max = 10 * log10(VIS_cyto_SNR_max);

% box plot
num_neurons_total = [SSP_soma_SNR_max'; SSP_cyto_SNR_max'];
g1 = repmat({'Soma-localized'},length(SSP_soma_SNR_max),1);
g2 = repmat({'Cytosolic'},length(SSP_cyto_SNR_max),1);
g = [g1; g2];
figure; subplot(1,2,1);
boxplot(num_neurons_total,g); %ylim([0, 35]);
title('SSP');
ylabel('peak SNR');
[~, p] = ttest2(SSP_soma_SNR_max, SSP_cyto_SNR_max);
title(['SSP (p-value: ', num2str(p), ')']);

num_neurons_total = [VIS_soma_SNR_max'; VIS_cyto_SNR_max'];
g1 = repmat({'Soma-localized'},length(VIS_soma_SNR_max),1);
g2 = repmat({'Cytosolic'},length(VIS_cyto_SNR_max),1);
g = [g1; g2];
subplot(1,2,2);
boxplot(num_neurons_total,g); %ylim([0, 35]);
title('VIS');
[~, p] = ttest2(VIS_soma_SNR_max, VIS_cyto_SNR_max);
title(['VIS (p-value: ', num2str(p), ')']);

% bar plot
figure;
subplot(1,2,1);
mean_data = [mean(SSP_soma_SNR_max), mean(SSP_cyto_SNR_max)];
std_data = [std(SSP_soma_SNR_max), std(SSP_cyto_SNR_max)];
bar(mean_data, 'b'); % 'b' specifies blue bars
hold on; % Keeps the bar plot visible while we add the error bars
errorbar(1:2, mean_data, std_data, '.k'); % '.k' specifies black dots for the error bars
% ylim([-1, 4]);
xticklabels({'soma', 'cyto'});
ylabel('peak SNR');
[~, p] = ttest2(SSP_soma_SNR_max, SSP_cyto_SNR_max);
title(['SSP (p-value: ', num2str(p), ')']);

subplot(1,2,2);
mean_data = [mean(VIS_soma_SNR_max), mean(VIS_cyto_SNR_max)];
std_data = [std(VIS_soma_SNR_max), std(VIS_cyto_SNR_max)];
bar(mean_data, 'b'); % 'b' specifies blue bars
hold on; % Keeps the bar plot visible while we add the error bars
errorbar(1:2, mean_data, std_data, '.k'); % '.k' specifies black dots for the error bars
% ylim([-1, 4]);
xticklabels({'soma', 'cyto'});
[~, p] = ttest2(VIS_soma_SNR_max, VIS_cyto_SNR_max);
title(['VIS (p-value: ', num2str(p), ')']);

%% Panel j (decay time)
% initialize result array
decay_time_SSP_soma = [];
decay_time_SSP_cyto = [];
decay_time_VIS_soma = [];
decay_time_VIS_cyto = [];

% SSP soma
for nid = 1:size(good_signals_SSP_soma, 1)
    [max_value, max_index] = max(good_signals_SSP_soma(nid, :));
    threshold = max_value * 0;
    if max_index + 1 > size(good_signals_SSP_soma, 2)
        continue;
    end
    for t_idx = max_index+1:size(good_signals_SSP_soma, 2)
        if good_signals_SSP_soma(nid, t_idx) < threshold
            break;
        end
    end
    if t_idx == size(good_signals_SSP_soma, 2)
        continue
    end
    current_decay_time = t_idx - max_index;
    decay_time_SSP_soma(end+1) = current_decay_time;
end

% SSP cyto
for nid = 1:size(good_signals_SSP_cyto, 1)
    [max_value, max_index] = max(good_signals_SSP_cyto(nid, :));
    threshold = max_value * 0;
    if max_index + 1 > size(good_signals_SSP_cyto, 2)
        continue;
    end
    for t_idx = max_index+1:size(good_signals_SSP_cyto, 2)
        if good_signals_SSP_cyto(nid, t_idx) < threshold
            break;
        end
    end
    if t_idx == size(good_signals_SSP_cyto, 2)
        continue
    end
    current_decay_time = t_idx - max_index;
    decay_time_SSP_cyto(end+1) = current_decay_time;
end

% VIS soma
for nid = 1:size(good_signals_VIS_soma, 1)
    [max_value, max_index] = max(good_signals_VIS_soma(nid, :));
    threshold = max_value * 0;
    if max_index + 1 > size(good_signals_VIS_soma, 2)
        continue;
    end
    for t_idx = max_index+1:size(good_signals_VIS_soma, 2)
        if good_signals_VIS_soma(nid, t_idx) < threshold
            break;
        end
    end
    if t_idx == size(good_signals_VIS_soma, 2)
        continue
    end
    current_decay_time = t_idx - max_index;
    decay_time_VIS_soma(end+1) = current_decay_time;
end

% VIS cyto
for nid = 1:size(good_signals_VIS_cyto, 1)
    [max_value, max_index] = max(good_signals_VIS_cyto(nid, :));
    threshold = max_value * 0;
    if max_index + 1 > size(good_signals_VIS_cyto, 2)
        continue;
    end
    for t_idx = max_index+1:size(good_signals_VIS_cyto, 2)
        if good_signals_VIS_cyto(nid, t_idx) < threshold
            break;
        end
    end
    if t_idx == size(good_signals_VIS_cyto, 2)
        continue
    end
    current_decay_time = t_idx - max_index;
    decay_time_VIS_cyto(end+1) = current_decay_time;
end

% Create the bar plot (SSP)
figure;
subplot(1,2,1);
mean_data = [mean(decay_time_SSP_soma*0.075), mean(decay_time_SSP_cyto*0.075)];
std_data = [std(decay_time_SSP_soma*0.075), std(decay_time_SSP_cyto*0.075)];
bar(mean_data, 'b'); % 'b' specifies blue bars
hold on; % Keeps the bar plot visible while we add the error bars
errorbar(1:2, mean_data, std_data, '.k'); % '.k' specifies black dots for the error bars
xticklabels({'soma', 'cyto'});
% ylim([0.8, 0.9])
[h, p] = ttest2(decay_time_SSP_soma*0.075, decay_time_SSP_cyto*0.075)
title(['SSP (p value: ', num2str(p), ')']);
ylabel('decay time (sec)');

% Create the bar plot (VIS)
subplot(1,2,2);
mean_data = [mean(decay_time_VIS_soma*0.075), mean(decay_time_VIS_cyto*0.075)];
std_data = [std(decay_time_VIS_soma*0.075), std(decay_time_VIS_cyto*0.075)];
bar(mean_data, 'b'); % 'b' specifies blue bars
hold on; % Keeps the bar plot visible while we add the error bars
errorbar(1:2, mean_data, std_data, '.k'); % '.k' specifies black dots for the error bars
xticklabels({'soma', 'cyto'});
% ylim([0.8, 0.9])
[h, p] = ttest2(decay_time_VIS_soma*0.075, decay_time_VIS_cyto*0.075)
title(['VIS (p value: ', num2str(p), ')']);

%% Panel k (detected neurons)
run_data_str_list = {'V_537_5_middle', 'V_537_7_middle', 'W_537_4_left_01', 'W_537_4_left_02', 'W_537_8_01', 'W_537_8_03',...
    'V_546_1_middle', 'W_546_5_01', 'W_546_5_03', 'W_546_6_01', 'W_546_9_01',...
    'V_537_5_v', 'V_537_6_v', 'V_537_7_v', 'W_537_4_s1_01', 'W_537_8_02',...
    'V_546_1_v', 'W_546_5_02', 'W_546_8_02'};
num_neurons_list_SSP_soma = [];
num_neurons_list_SSP_cyto = [];
num_neurons_list_VIS_soma = [];
num_neurons_list_VIS_cyto = [];

for run_data_str_idx = 1:length(run_data_str_list)
    run_data_str = run_data_str_list{run_data_str_idx};

    % remove droplet-like artifacts
    if strcmp(run_data_str, 'V_537_5_middle')
        left_upper_corners = [[427, 169]];
        right_lower_corners = [[489, 226]];
        run_data = V_537_5_middle;
        data_type = 'SSP_soma';
    elseif strcmp(run_data_str, 'V_537_5_v')
        left_upper_corners = [];
        right_lower_corners = [];
        run_data = V_537_5_v;
        data_type = 'VIS_soma';
    elseif strcmp(run_data_str, 'V_537_6_v')
        left_upper_corners = [[370, 345]; [390, 201]; [353, 174]; [334, 24]; [272, 5]];
        right_lower_corners = [[450, 425]; [442, 253]; [407, 225]; [508, 169]; [395, 64]];
        run_data = V_537_6_v;
        data_type = 'VIS_soma';
    elseif strcmp(run_data_str, 'V_537_7_middle')
        left_upper_corners = [[376, 0]; [413, 285]];
        right_lower_corners = [[404, 14]; [449, 323]];
        run_data = V_537_7_middle;
        data_type = 'SSP_soma';
    elseif strcmp(run_data_str, 'V_537_7_top')
        left_upper_corners = [[401, 131]];
        right_lower_corners = [[462, 184]];
        run_data = V_537_7_top;
        data_type = 'None';
    elseif strcmp(run_data_str, 'V_537_7_v')
        left_upper_corners = [[455, 466]];
        right_lower_corners = [[506, 510]];
        run_data = V_537_7_v;
        data_type = 'VIS_soma';
    elseif strcmp(run_data_str, 'V_546_1_middle')
        left_upper_corners = [];
        right_lower_corners = [];
        run_data = V_546_1_middle;
        data_type = 'SSP_cyto';
    elseif strcmp(run_data_str, 'V_546_1_v')
        left_upper_corners = [];
        right_lower_corners = [];
        run_data = V_546_1_v;
        data_type = 'VIS_cyto';
    elseif strcmp(run_data_str, 'V_546_2_middle')
        left_upper_corners = [];
        right_lower_corners = [];
        run_data = V_546_2_middle;
        data_type = 'None';
    elseif strcmp(run_data_str, 'V_546_2_top')
        left_upper_corners = [[209, 0]];
        right_lower_corners = [[288, 42]];
        run_data = V_546_2_top;
        data_type = 'None';
    elseif strcmp(run_data_str, 'V_546_2_v')
        left_upper_corners = [[182, 470]; [270, 236]];
        right_lower_corners = [[277, 512]; [511, 510]];
        run_data = V_546_2_v;
        data_type = 'None';
    elseif strcmp(run_data_str, 'V_546_3_middle')
        left_upper_corners = [[269, 45]];
        right_lower_corners = [[335, 120]];
        run_data = V_546_3_middle;
        data_type = 'None';
    elseif strcmp(run_data_str, 'V_546_3_v')
        left_upper_corners = [[393, 129]; [154, 2]];
        right_lower_corners = [[432, 166]; [206, 46]];
        run_data = V_546_3_v;
        data_type = 'None';
    elseif strcmp(run_data_str, 'W_537_4_left_01')
        left_upper_corners = [];
        right_lower_corners = [];
        run_data = W_537_4_left_01;
        data_type = 'SSP_soma';
    elseif strcmp(run_data_str, 'W_537_4_left_02')
        left_upper_corners = [];
        right_lower_corners = [];
        run_data = W_537_4_left_02;
        data_type = 'SSP_soma';
    elseif strcmp(run_data_str, 'W_537_4_s1_01')
        left_upper_corners = [];
        right_lower_corners = [];
        run_data = W_537_4_s1_01;
        data_type = 'VIS_soma';
    elseif strcmp(run_data_str, 'W_537_8_01')
        left_upper_corners = [[108, 76]; [326, 49]];
        right_lower_corners = [[152, 112]; [403, 117]];
        run_data = W_537_8_01;
        data_type = 'SSP_soma';
    elseif strcmp(run_data_str, 'W_537_8_02')
        left_upper_corners = [[61, 232]; [260, 461]];
        right_lower_corners = [[130, 303]; [424, 511]];
        run_data = W_537_8_02;
        data_type = 'VIS_soma';
    elseif strcmp(run_data_str, 'W_537_8_03')
        left_upper_corners = [];
        right_lower_corners = [];
        run_data = W_537_8_03;
        data_type = 'SSP_soma';
    elseif strcmp(run_data_str, 'W_546_5_01')
        left_upper_corners = [[379, 135]];
        right_lower_corners = [[448, 196]];
        run_data = W_546_5_01;
        data_type = 'SSP_cyto';
    elseif strcmp(run_data_str, 'W_546_5_02')
        left_upper_corners = [[0, 261]];
        right_lower_corners = [[47, 415]];
        run_data = W_546_5_02;
        data_type = 'VIS_cyto';
    elseif strcmp(run_data_str, 'W_546_5_03')
        left_upper_corners = [];
        right_lower_corners = [];
        run_data = W_546_5_03;
        data_type = 'SSP_cyto';
    elseif strcmp(run_data_str, 'W_546_6_01')
        left_upper_corners = [[48, 8]; [13, 81]];
        right_lower_corners = [[81, 46]; [57, 135]];
        run_data = W_546_6_01;
        data_type = 'SSP_cyto';
    elseif strcmp(run_data_str, 'W_546_8_01')
        left_upper_corners = [];
        right_lower_corners = [];
        run_data = W_546_8_01;
        data_type = 'None';
    elseif strcmp(run_data_str, 'W_546_8_02')
        left_upper_corners = [[0, 0]];
        right_lower_corners = [[122, 86]];
        run_data = W_546_8_02;
        data_type = 'VIS_cyto';
    elseif strcmp(run_data_str, 'W_546_9_01')
        left_upper_corners = [[414, 28]; [367, 164]];
        right_lower_corners = [[453, 64]; [509, 279]];
        run_data = W_546_9_01;
        data_type = 'SSP_cyto';
    end

    % find only good neurons
    tmp_image = zeros(512, 512, 'single');
    all_centers = zeros(512, 512, 'single');
    num_neurons = size(run_data.A, 2);
    banned_neurons = [];
    current_num_neurons = 0;
    for nid = 1:num_neurons
        tmp_neuron = run_data.A(:, nid);
        tmp_neuron = full(tmp_neuron);
        [M, I] = max(tmp_neuron);

        x_idx = floor((I-1) / 512);
        y_idx = I - 512*floor(I / 512);
        if size(left_upper_corners, 1) ~= 0
            for i = 1:size(left_upper_corners, 1)
                x_start = left_upper_corners(i, 1);
                x_end = right_lower_corners(i, 1);
                y_start = left_upper_corners(i, 2);
                y_end = right_lower_corners(i, 2);

                if (x_idx >= x_start) && (x_idx <= x_end) && (y_idx >= y_start) && (y_idx <= y_end)
                    banned_neurons(end+1) = nid;
                    break
                end
            end
        end

        if ismember(nid, banned_neurons)
            continue
        end
        all_centers(I) = 1;
        current_num_neurons = current_num_neurons + 1;
    end
    if strcmp(data_type, 'SSP_soma')
        num_neurons_list_SSP_soma(end+1) = current_num_neurons;
    elseif strcmp(data_type, 'SSP_cyto')
        num_neurons_list_SSP_cyto(end+1) = current_num_neurons;
    elseif strcmp(data_type, 'VIS_soma')
        num_neurons_list_VIS_soma(end+1) = current_num_neurons;
    elseif strcmp(data_type, 'VIS_cyto')
        num_neurons_list_VIS_cyto(end+1) = current_num_neurons;
    elseif strcmp(data_type, 'None')
        continue
    else
        disp('error');
    end
end

% box plot
num_neurons_total = [num_neurons_list_SSP_soma'; num_neurons_list_SSP_cyto'];
g1 = repmat({'Soma'},length(num_neurons_list_SSP_soma),1);
g2 = repmat({'Cytosolic'},length(num_neurons_list_SSP_cyto),1);
g = [g1; g2];
figure; subplot(1,3,1);
boxplot(num_neurons_total,g); %ylim([0, 500]);
ylabel('Num neurons');
[h, p] = ttest2(num_neurons_list_SSP_soma, num_neurons_list_SSP_cyto);
title(['SSP (p value: ', num2str(p), ')']);

num_neurons_total = [num_neurons_list_VIS_soma'; num_neurons_list_VIS_cyto'];
g1 = repmat({'Soma'},length(num_neurons_list_VIS_soma),1);
g2 = repmat({'Cytosolic'},length(num_neurons_list_VIS_cyto),1);
g = [g1; g2];
subplot(1,3,2);
boxplot(num_neurons_total,g); %ylim([0, 500]);
ylabel('Num neurons');
[h, p] = ttest2(num_neurons_list_VIS_soma, num_neurons_list_VIS_cyto);
title(['VIS (p value: ', num2str(p), ')']);

SSP_VIS_soma = [num_neurons_list_SSP_soma, num_neurons_list_VIS_soma];
SSP_VIS_cyto = [num_neurons_list_SSP_cyto, num_neurons_list_VIS_cyto];

num_neurons_total = [SSP_VIS_soma'; SSP_VIS_cyto'];
g1 = repmat({'Soma'},length(SSP_VIS_soma),1);
g2 = repmat({'Cytosolic'},length(SSP_VIS_cyto),1);
g = [g1; g2];
subplot(1,3,3);
boxplot(num_neurons_total,g); %ylim([0, 500]);
ylabel('Num neurons');
[h, p] = ttest2(SSP_VIS_soma, SSP_VIS_cyto);
title(['SSP + VIS (p value: ', num2str(p), ')']);