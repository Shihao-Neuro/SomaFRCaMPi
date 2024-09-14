%% Test dff

data = readtable();
data1 = table2array(data);
data1 = data1';

for i = 2:size(data1,1)
    threshold = prctile(data1(i,:),20);
    baseline = data1(i,find(data1(i,:) <= threshold));
    maxdff(i - 1) = max(data1(i,:));
    index(i - 1) = find(data1(i,:) == maxdff(i - 1));
    meanbaseline(i - 1) = mean(baseline);
    stdbaseline(i - 1) = std(baseline);
    snr(i - 1) = (maxdff(i - 1) - meanbaseline(i - 1)) / stdbaseline(i - 1);
end
