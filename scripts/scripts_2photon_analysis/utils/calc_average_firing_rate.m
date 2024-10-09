function [average_firing_rate_week6_JR] = calc_average_firing_rate(week6_JR_S)

    average_firing_rate_week6_JR = [];
    for i = 1:length(week6_JR_S)
        average_firing_rate = sum(week6_JR_S{i} > 0, 1) / size(week6_JR_S{i}, 1);
        average_firing_rate_week6_JR = [average_firing_rate_week6_JR, average_firing_rate];
    end
end

