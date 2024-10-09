%% load data
week6_JR_hdf5 = {'.\results\6weeks\WT_1new_JR\RV_test1_z100_7hz.hdf5',...
    '.\results\6weeks\WT_1new_JR\RV_test2_z120_7hz.hdf5',...
    '.\results\6weeks\WT_1new_JR\RV_test3_z150_7hz.hdf5',...
    '.\results\6weeks\WT_1new_JR\RV_test4_z180_7hz.hdf5'};
week6_FR_hdf5 = {'.\results\6weeks\WT_2new_FR\RV1_test1_z100_7hz.hdf5',...
    '.\results\6weeks\WT_2new_FR\RV1_test2_z150_7hz.hdf5',...
    '.\results\6weeks\WT_2new_FR\RV1_test2_z180_7hz.hdf5',...
    '.\results\6weeks\WT_2new_FR\RV1_test4_z200_7hz.hdf5'};
week6_FRSoma_hdf5 = {'.\results\6weeks\WT_6_FR-soma\RV1_test1_z130_7hz_RbarrelGcamp.hdf5',...
    '.\results\6weeks\WT_6_FR-soma\RV1_test2_z150_7hz_RbarrelGcamp.hdf5',...
    '.\results\6weeks\WT_6_FR-soma\RV1_test3_z100_7hz_RbarrelGcamp.hdf5',...
    '.\results\6weeks\WT_6_FR-soma\RV1_test4_z120_7hz_RbarrelGcamp.hdf5',...
    '.\results\6weeks\WT_6_FR-soma\RV1_test5_z150_7hz_RbarrelGcamp.hdf5'};

month4_JR_hdf5 = {'.\results\4monthes\WT_1new_JR\RV1_test1_z100_7hz.hdf5',...
    '.\results\4monthes\WT_1new_JR\RV1_test2_z150_7hz.hdf5',...
    '.\results\4monthes\WT_1new_JR\RV1_test3_z190_7hz.hdf5',...
    '.\results\4monthes\WT_1new_JR\RV1_test4_z350_7hz.hdf5'};
month4_FR_hdf5 = {'.\results\4monthes\WT_2new_FR\RV1_test1_z120_7hz.hdf5',...
    '.\results\4monthes\WT_2new_FR\RV1_test2_z180_7hz.hdf5',...
    '.\results\4monthes\WT_2new_FR\RV1_test3_z230_7hz.hdf5',...
    '.\results\4monthes\WT_2new_FR\RV1_test4_z200_7hz.hdf5'};
month4_FRSoma_hdf5 = {'.\results\4monthes\WT_6_FR_soma\RV1_test1_z100_7hz.hdf5',...
    '.\results\4monthes\WT_6_FR_soma\RV1_test2_z130_7hz.hdf5',...
    '.\results\4monthes\WT_6_FR_soma\RV1_test3_z150_7hz.hdf5',...
    '.\results\4monthes\WT_6_FR_soma\RV1_test4_z180_7hz.hdf5',...
    '.\results\4monthes\WT_6_FR_soma\RV1_test5_z230_7hz.hdf5'};

[week6_JR_AIP, week6_JR_F_dff, week6_JR_S, week6_JR_A_data, week6_JR_A_indices, week6_JR_A_indptr] = load_CNMF(week6_JR_hdf5);
[week6_FR_AIP, week6_FR_F_dff, week6_FR_S, week6_FR_A_data, week6_FR_A_indices, week6_FR_A_indptr] = load_CNMF(week6_FR_hdf5);
[week6_FRSoma_AIP, week6_FRSoma_F_dff, week6_FRSoma_S, week6_FRSoma_A_data, week6_FRSoma_A_indices, week6_FRSoma_A_indptr] = load_CNMF(week6_FRSoma_hdf5);

[month4_JR_AIP, month4_JR_F_dff, month4_JR_S, month4_JR_A_data, month4_JR_A_indices, month4_JR_A_indptr] = load_CNMF(month4_JR_hdf5);
[month4_FR_AIP, month4_FR_F_dff, month4_FR_S, month4_FR_A_data, month4_FR_A_indices, month4_FR_A_indptr] = load_CNMF(month4_FR_hdf5);
[month4_FRSoma_AIP, month4_FRSoma_F_dff, month4_FRSoma_S, month4_FRSoma_A_data, month4_FRSoma_A_indices, month4_FRSoma_A_indptr] = load_CNMF(month4_FRSoma_hdf5);

%% neuron shape
A_dense = zeros(length(A_indptr)-1, size(AIP, 1), size(AIP, 2), 'single');

for nid = 1:length(A_indptr)-1
    start_pt = A_indptr(nid)+1;
    end_pt = A_indptr(nid+1);
    A_data_current = A_data(start_pt:end_pt);
    A_indices_current = A_indices(start_pt:end_pt);
    tmp_arr = zeros(size(AIP, 1), size(AIP, 2), 'single');
    tmp_arr(A_indices_current) = A_data_current;
    A_dense(nid, :, :) = tmp_arr;
end

A_dense_MIP = max(A_dense, [], 1);
A_dense_MIP = squeeze(A_dense_MIP);

subplot(1,2,1);
imagesc(AIP, [100, 300]); axis image; colormap('gray'); colorbar; title('Average intensity projection');
subplot(1,2,2);
imagesc(A_dense_MIP, [0, 0.15]); axis image; colormap('gray'); colorbar; title('Deteceted active neurons');

%% Firing rate
average_firing_rate_week6_JR = calc_average_firing_rate(week6_JR_S);
average_firing_rate_week6_FR = calc_average_firing_rate(week6_FR_S);
average_firing_rate_week6_FRSoma = calc_average_firing_rate(week6_FRSoma_S);

average_firing_rate_month4_JR = calc_average_firing_rate(month4_JR_S);
average_firing_rate_month4_FR = calc_average_firing_rate(month4_FR_S);
average_firing_rate_month4_FRSoma = calc_average_firing_rate(month4_FRSoma_S);

num_neurons_total = [average_firing_rate_week6_JR'; average_firing_rate_week6_FR'; average_firing_rate_week6_FRSoma'];
g1 = repmat({'JRGECO'},length(average_firing_rate_week6_JR),1);
g2 = repmat({'FRCaMPi'},length(average_firing_rate_week6_FR),1);
g3 = repmat({'SomaFRCaMPi'},length(average_firing_rate_week6_FRSoma),1);
g = [g1; g2; g3];
figure; subplot(1,2,1);
boxplot(num_neurons_total,g); ylim([0, 0.65]); title('Week 6');
ylabel('Average firing rate [Hz]');

num_neurons_total = [average_firing_rate_month4_JR'; average_firing_rate_month4_FR'; average_firing_rate_month4_FRSoma'];
g1 = repmat({'JRGECO'},length(average_firing_rate_month4_JR),1);
g2 = repmat({'FRCaMPi'},length(average_firing_rate_month4_FR),1);
g3 = repmat({'SomaFRCaMPi'},length(average_firing_rate_month4_FRSoma),1);
g = [g1; g2; g3];
subplot(1,2,2);
boxplot(num_neurons_total,g); ylim([0, 0.65]); title('Month 4');

%% peak dFF
peak_dFF_week6_JR = calc_peak_dFF(week6_JR_F_dff);
peak_dFF_week6_FR = calc_peak_dFF(week6_FR_F_dff);
peak_dFF_week6_FRSoma = calc_peak_dFF(week6_FRSoma_F_dff);

peak_dFF_month4_JR = calc_peak_dFF(month4_JR_F_dff);
peak_dFF_month4_FR = calc_peak_dFF(month4_FR_F_dff);
peak_dFF_month4_FRSoma = calc_peak_dFF(month4_FRSoma_F_dff);

num_neurons_total = [peak_dFF_week6_JR'; peak_dFF_week6_FR'; peak_dFF_week6_FRSoma'];
g1 = repmat({'JRGECO'},length(peak_dFF_week6_JR),1);
g2 = repmat({'FRCaMPi'},length(peak_dFF_week6_FR),1);
g3 = repmat({'SomaFRCaMPi'},length(peak_dFF_week6_FRSoma),1);
g = [g1; g2; g3];
figure; subplot(1,2,1);
boxplot(num_neurons_total,g); ylim([0, 3.5]); title('Week 6');
ylabel('peak dFF');

num_neurons_total = [peak_dFF_month4_JR'; peak_dFF_month4_FR'; peak_dFF_month4_FRSoma'];
g1 = repmat({'JRGECO'},length(peak_dFF_month4_JR),1);
g2 = repmat({'FRCaMPi'},length(peak_dFF_month4_FR),1);
g3 = repmat({'SomaFRCaMPi'},length(peak_dFF_month4_FRSoma),1);
g = [g1; g2; g3];
subplot(1,2,2);
boxplot(num_neurons_total,g); ylim([0, 3.5]); title('Month 4');

%% peak SNR
peak_SNR_week6_JR = calc_peak_SNR(week6_JR_F_dff);
peak_SNR_week6_FR = calc_peak_SNR(week6_FR_F_dff);
peak_SNR_week6_FRSoma = calc_peak_SNR(week6_FRSoma_F_dff);

peak_SNR_month4_JR = calc_peak_SNR(month4_JR_F_dff);
peak_SNR_month4_FR = calc_peak_SNR(month4_FR_F_dff);
peak_SNR_month4_FRSoma = calc_peak_SNR(month4_FRSoma_F_dff);

num_neurons_total = [peak_SNR_week6_JR'; peak_SNR_week6_FR'; peak_SNR_week6_FRSoma'];
g1 = repmat({'JRGECO'},length(peak_SNR_week6_JR),1);
g2 = repmat({'FRCaMPi'},length(peak_SNR_week6_FR),1);
g3 = repmat({'SomaFRCaMPi'},length(peak_SNR_week6_FRSoma),1);
g = [g1; g2; g3];
figure; subplot(1,2,1);
boxplot(num_neurons_total,g); ylim([-3, 14]); title('Week 6');
ylabel('peak SNR [dB]');

num_neurons_total = [peak_SNR_month4_JR'; peak_SNR_month4_FR'; peak_SNR_month4_FRSoma'];
g1 = repmat({'JRGECO'},length(peak_SNR_month4_JR),1);
g2 = repmat({'FRCaMPi'},length(peak_SNR_month4_FR),1);
g3 = repmat({'SomaFRCaMPi'},length(peak_SNR_month4_FRSoma),1);
g = [g1; g2; g3];
subplot(1,2,2);
boxplot(num_neurons_total,g); ylim([-3, 14]); title('Month 4');

%% single spike calcium kernel
min_interval = 40; % in frames (there need to be no spikes before and after this period)
std_coverage = 0.5;
ylim_range = [-0.05, 0.2];

good_signals_week6_JR = [];
good_signals_week6_FR = [];
good_signals_week6_FRSoma = [];
good_signals_month4_JR = [];
good_signals_month4_FR = [];
good_signals_month4_FRSoma = [];

[good_signals_week6_JR, num_neurons_week6_JR] = find_isolated_signals_cell(week6_JR_S, week6_JR_F_dff, min_interval);
[good_signals_week6_FR, num_neurons_week6_FR] = find_isolated_signals_cell(week6_FR_S, week6_FR_F_dff, min_interval);
[good_signals_week6_FRSoma, num_neurons_week6_FRSoma] = find_isolated_signals_cell(week6_FRSoma_S, week6_FRSoma_F_dff, min_interval);
[good_signals_month4_JR, num_neurons_month4_JR] = find_isolated_signals_cell(month4_JR_S, month4_JR_F_dff, min_interval);
[good_signals_month4_FR, num_neurons_month4_FR] = find_isolated_signals_cell(month4_FR_S, month4_FR_F_dff, min_interval);
[good_signals_month4_FRSoma, num_neurons_month4_FRSoma] = find_isolated_signals_cell(month4_FRSoma_S, month4_FRSoma_F_dff, min_interval);

% plot signals
figure;
subplot(2, 4, 1);
time = 1:min_interval*2-1;
meanSignal = mean(good_signals_week6_JR, 1);
stdSignal = std(good_signals_week6_JR, 1);
plot(meanSignal, 'k', 'LineWidth', 2); % 'k' for black line
hold on;
upperShade = meanSignal + stdSignal * std_coverage;
lowerShade = meanSignal - stdSignal * std_coverage;
fill([time, fliplr(time)], [upperShade, fliplr(lowerShade)], 'k', 'FaceAlpha', 0.1, 'EdgeColor', 'none');
ylim(ylim_range);
xlabel('Time (frames)')
ylabel('dFF')
title('Week 6, jRGECO')

subplot(2, 4, 2);
time = 1:min_interval*2-1;
meanSignal = mean(good_signals_week6_FR, 1);
stdSignal = std(good_signals_week6_FR, 1);
plot(meanSignal, 'k', 'LineWidth', 2); % 'k' for black line
hold on;
upperShade = meanSignal + stdSignal * std_coverage;
lowerShade = meanSignal - stdSignal * std_coverage;
fill([time, fliplr(time)], [upperShade, fliplr(lowerShade)], 'k', 'FaceAlpha', 0.1, 'EdgeColor', 'none');
ylim(ylim_range);
xlabel('Time (frames)')
ylabel('dFF')
title('Week 6, FRCaMPi')

subplot(2, 4, 3);
time = 1:min_interval*2-1;
meanSignal = mean(good_signals_week6_FRSoma, 1);
stdSignal = std(good_signals_week6_FRSoma, 1);
plot(meanSignal, 'k', 'LineWidth', 2); % 'k' for black line
hold on;
upperShade = meanSignal + stdSignal * std_coverage;
lowerShade = meanSignal - stdSignal * std_coverage;
fill([time, fliplr(time)], [upperShade, fliplr(lowerShade)], 'k', 'FaceAlpha', 0.1, 'EdgeColor', 'none');
ylim(ylim_range);
xlabel('Time (frames)')
ylabel('dFF')
title('Week 6, SomaFRCaMPi')

subplot(2, 4, 5);
time = 1:min_interval*2-1;
meanSignal = mean(good_signals_month4_JR, 1);
stdSignal = std(good_signals_month4_JR, 1);
plot(meanSignal, 'k', 'LineWidth', 2); % 'k' for black line
hold on;
upperShade = meanSignal + stdSignal * std_coverage;
lowerShade = meanSignal - stdSignal * std_coverage;
fill([time, fliplr(time)], [upperShade, fliplr(lowerShade)], 'k', 'FaceAlpha', 0.1, 'EdgeColor', 'none');
ylim(ylim_range);
xlabel('Time (frames)')
ylabel('dFF')
title('Month 4, jRGECO')

subplot(2, 4, 6);
time = 1:min_interval*2-1;
meanSignal = mean(good_signals_month4_FR, 1);
stdSignal = std(good_signals_month4_FR, 1);
plot(meanSignal, 'k', 'LineWidth', 2); % 'k' for black line
hold on;
upperShade = meanSignal + stdSignal * std_coverage;
lowerShade = meanSignal - stdSignal * std_coverage;
fill([time, fliplr(time)], [upperShade, fliplr(lowerShade)], 'k', 'FaceAlpha', 0.1, 'EdgeColor', 'none');
ylim(ylim_range);
xlabel('Time (frames)')
ylabel('dFF')
title('Month 4, FRCaMPi')

subplot(2, 4, 7);
time = 1:min_interval*2-1;
meanSignal = mean(good_signals_month4_FRSoma, 1);
stdSignal = std(good_signals_month4_FRSoma, 1);
plot(meanSignal, 'k', 'LineWidth', 2); % 'k' for black line
hold on;
upperShade = meanSignal + stdSignal * std_coverage;
lowerShade = meanSignal - stdSignal * std_coverage;
fill([time, fliplr(time)], [upperShade, fliplr(lowerShade)], 'k', 'FaceAlpha', 0.1, 'EdgeColor', 'none');
ylim(ylim_range);
xlabel('Time (frames)')
ylabel('dFF')
title('Month 4, SomaFRCaMPi')

% plot signals (overlay)
subplot(2, 4, 4);
time = 1:min_interval*2-1;
meanSignal = mean(good_signals_week6_JR, 1);
stdSignal = std(good_signals_week6_JR, 1);
plot(meanSignal, 'k', 'LineWidth', 1); % 'k' for black line
hold on;
upperShade = meanSignal + stdSignal * std_coverage;
lowerShade = meanSignal - stdSignal * std_coverage;
fill([time, fliplr(time)], [upperShade, fliplr(lowerShade)], 'k', 'FaceAlpha', 0.00, 'EdgeColor', 'none');

meanSignal = mean(good_signals_week6_FR, 1);
stdSignal = std(good_signals_week6_FR, 1);
plot(meanSignal, 'r', 'LineWidth', 1); % 'k' for black line
hold on;
upperShade = meanSignal + stdSignal * std_coverage;
lowerShade = meanSignal - stdSignal * std_coverage;
fill([time, fliplr(time)], [upperShade, fliplr(lowerShade)], 'r', 'FaceAlpha', 0.00, 'EdgeColor', 'none');

meanSignal = mean(good_signals_week6_FRSoma, 1);
stdSignal = std(good_signals_week6_FRSoma, 1);
plot(meanSignal, 'b', 'LineWidth', 1); % 'k' for black line
hold on;
upperShade = meanSignal + stdSignal * std_coverage;
lowerShade = meanSignal - stdSignal * std_coverage;
fill([time, fliplr(time)], [upperShade, fliplr(lowerShade)], 'b', 'FaceAlpha', 0.00, 'EdgeColor', 'none');

legend('jRGECO', '', 'FRCaMPi', '', 'SomaFRCaMPi');
ylim(ylim_range);
xlabel('Time (frames)');
ylabel('dFF');
title('Week 6, Overlay');

subplot(2, 4, 8);
time = 1:min_interval*2-1;
meanSignal = mean(good_signals_month4_JR, 1);
stdSignal = std(good_signals_month4_JR, 1);
plot(meanSignal, 'k', 'LineWidth', 1); % 'k' for black line
hold on;
upperShade = meanSignal + stdSignal * std_coverage;
lowerShade = meanSignal - stdSignal * std_coverage;
fill([time, fliplr(time)], [upperShade, fliplr(lowerShade)], 'k', 'FaceAlpha', 0.00, 'EdgeColor', 'none');

meanSignal = mean(good_signals_month4_FR, 1);
stdSignal = std(good_signals_month4_FR, 1);
plot(meanSignal, 'r', 'LineWidth', 1); % 'k' for black line
hold on;
upperShade = meanSignal + stdSignal * std_coverage;
lowerShade = meanSignal - stdSignal * std_coverage;
fill([time, fliplr(time)], [upperShade, fliplr(lowerShade)], 'r', 'FaceAlpha', 0.00, 'EdgeColor', 'none');

meanSignal = mean(good_signals_month4_FRSoma, 1);
stdSignal = std(good_signals_month4_FRSoma, 1);
plot(meanSignal, 'b', 'LineWidth', 1); % 'k' for black line
hold on;
upperShade = meanSignal + stdSignal * std_coverage;
lowerShade = meanSignal - stdSignal * std_coverage;
fill([time, fliplr(time)], [upperShade, fliplr(lowerShade)], 'b', 'FaceAlpha', 0.00, 'EdgeColor', 'none');

legend('jRGECO', '', 'FRCaMPi', '', 'SomaFRCaMPi');
ylim(ylim_range);
xlabel('Time (frames)');
ylabel('dFF');
title('Month 4, Overlay');


