function [fitresult, gof,R2,rmse_,Stemp] = back_fun(t, sigtemp)
%CREATEFIT(T,SIGTEMP)
%  创建一个拟合。
%
%  要进行 '无标题拟合 1' 拟合的数据:
%      X 输入: t
%      Y 输出: sigtemp
%  输出:
%      fitresult: 表示拟合的拟合对象。
%      gof: 带有拟合优度信息的结构体。
%
%  另请参阅 FIT, CFIT, SFIT.

%  由 MATLAB 于 12-May-2023 17:34:14 自动生成


%% 拟合: '无标题拟合 1'。
[xData, yData] = prepareCurveData( t, sigtemp );

% 设置 fittype 和选项。
ft = fittype( 'a*2.^(-b.*x)+c' );
opts = fitoptions( 'Method', 'NonlinearLeastSquares' );
opts.Display = 'Off';
opts.StartPoint = [0.5 0.3 0.5];

% 对数据进行模型拟合。
 try
     [fitresult, gof] = fit( xData, yData, ft, opts );
     R2 = gof.rsquare;
     rmse_ = gof.rmse;
     a = fitresult.a;
     b = fitresult.b;
     c = fitresult.c;
     [max_data,loc] = max(sigtemp);
     syms x
     Stemp = vpasolve(a*2.^(-b.*x)+c == max_data/2,x);
     if isempty(Stemp)==0;
         Stemp =vpa(Stemp)-t(loc);
     else
         Stemp =-1; 
     end
 catch
        fitresult = NaN;
        gof = NaN;
        R2 = NaN;
        rmse_ = NaN;
        Stemp = -1;
 end
 end
