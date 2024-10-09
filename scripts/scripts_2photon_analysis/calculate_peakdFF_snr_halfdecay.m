function [T_dfF0_max_peak,T_dfF0_snr,T_halfdecay_expfit] = calculate_peakdFF_snr_halfdecay(T_dfF0_directions_ave,A_visual_evoked_neuron_all,T_dfF0_pref_dir);

for i = 1 : length(A_visual_evoked_neuron_all)
    temp_pref_dir = T_dfF0_pref_dir(i);
    [max_temp,max_loc_temp] = max(T_dfF0_directions_ave{temp_pref_dir}(i,31:90),[],2);
    if max_temp >= std(T_dfF0_directions_ave{temp_pref_dir}(i,1:30))*4 + mean(T_dfF0_directions_ave{temp_pref_dir}(i,1:30),2)
        % exp fit for half-decay time
        f = fittype( 'a*2.^(-b.*x)+c' );
        opts = fitoptions( 'Method', 'NonlinearLeastSquares' );
        opts.Display = 'Off';
        opts.StartPoint = [0.5 0.3 0.5];
        [fitresult,gof] = fit([1:150-max_loc_temp-30+1]',T_dfF0_directions_ave{temp_pref_dir}(i,max_loc_temp+30:150)',f,opts);
        T_halfdecay_expfit_R2(i) = gof.rsquare;
        a = fitresult.a;
        b = fitresult.b;
        c = fitresult.c;
        syms x
        Stemp = vpasolve(a*2.^(-b.*x)+c == max_temp/2,x);
        if ~isempty(Stemp)&&double(vpa(Stemp))>0
            T_halfdecay_expfit(i) =double(vpa(Stemp));
        else
            T_halfdecay_expfit(i) = NaN;
        end
    else
        T_halfdecay_expfit(i) = NaN;
        T_halfdecay_expfit_R2(i) = NaN;
    end
    T_dfF0_max_peak(i) = max(T_dfF0_directions{temp_pref_dir}(i,31:90,:),[],'all');
    [~,temp] = find(squeeze(T_dfF0_directions{temp_pref_dir}(i,:,:))==T_dfF0_max_peak(i));
    T_dfF0_snr(i) = T_dfF0_max_peak(i)/std(T_dfF0_directions{temp_pref_dir}(i,1:30,temp));
end

end