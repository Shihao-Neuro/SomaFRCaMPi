clc, clear
close all

%% load data    
load('\suite2p\plane0\Fall.mat') % load activity data, exported by suite2p
N_idx = find(iscell(:,1));
N_center = [];
for i = 1 : length(N_idx)
    N_center = [N_center;double(stat{N_idx(i)}.med)];
end
N_trace_raw = F(N_idx,:);
N_neutrace_raw = Fneu(N_idx,:);
N_trace = N_trace_raw - N_neutrace_raw*0.7;

%% neuron correlation -- neuropil contamination
k=1;
for i = 1 : size(N_trace_raw,1)
    for ii = i+1 : size(N_trace_raw,1)
        N_FRNBL_raw_corr(k) = corr(N_trace_raw(i,:)',N_trace_raw(ii,:)', 'Type', 'Pearson');
        N_FRNBL_corr(k) = corr(N_trace(i,:)',N_trace(ii,:)', 'Type', 'Pearson');
        N_FRNBL_dist(k) = sqrt((N_center(i,1)-N_center(ii,1)).^2+(N_center(i,2)-N_center(ii,2)).^2);
        k=k+1;
    end
end
% plot corr-dist tace
dist_span = [0:10:600];
N_dist_corr_cdf = [];
N_raw_dist_corr_cdf = [];
for i = 2 : length(dist_span)
    N_dist_idx_temp = intersect(find(dist_span(i-1)<=N_FRNBL_dist),find(dist_span(i)>N_FRNBL_dist));
    N_dist_corr_cdf(i-1) = mean(N_FRNBL_corr(N_dist_idx_temp));
    N_raw_dist_corr_cdf(i-1) = mean(N_FRNBL_raw_corr(N_dist_idx_temp));
end


  
           
           
           
           
           
           
           
           
           
           
           