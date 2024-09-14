%% Test dff
Results = readtable();
win = 200;
threshold = win*0.2;
half_win = win/2;
% dff_cell = zeros(size(new_data_Mean));
fire = table2array(Results)';
fire(1,:) = [];
dffcell = cell(1,10);
figure;
for i =1:10
    subplot(10,1,i);
    fire1 = fire(i,:);
    baseline = zeros(1,length(fire1));
    for j = half_win:length(fire1)-half_win
        matrix = fire1(j-half_win+1:j+half_win);
        s = sort(matrix);
        baseline(j) = s(threshold);
    end
    for j = 1 : half_win - 1
        matrix = fire1(j:j+half_win);
        s = sort(matrix);
        baseline(j) = s(threshold);
    end
    for j = 1200 - half_win + 1 : 1200
        matrix = fire1(j-half_win:j);
        s = sort(matrix);
        baseline(j) = s(threshold);
    end
    deltaF_F = fire1(1:end)-baseline;
    dff = deltaF_F./baseline;
    dffcell{1,i} = dff;
    % plot(fire1);
    hold on
    plot(dff)
    xlim([1,1200]);
    ylim([-0.2,1]);
    % plot(baseline);
    axis off
end
exportgraphics(gcf,'ROIdff.png')