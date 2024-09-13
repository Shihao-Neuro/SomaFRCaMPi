clear all;
close all;
clc;
tic
path  = '.\';    %此处为需要读取的文件所在路径
Filesname = dir(strcat(path,'*.xlsx'));                     %找到当前路径文件夹下的以.xlsx为后缀的文件名，strcat是横向连接字符的函数
Length = length(Filesname);    %计算文件夹里xlsx文档的个数
R2_all = [];%储存R2
rmse_all=[];%储存Rmse
Xback_all=[];%时间长度
for i = 1:Length              %批量读取文件的内容并保存
    xls_data = xlsread(strcat(path,Filesname (i).name),1);      
    file_name = Filesname (i).name;   
    [m,n] = size(xls_data);       %获取读取的单个excel的内容大小
    for j = 2:n 
        sigtemp = xls_data(:,j);
        [m1,n1] = max(sigtemp);
        t = xls_data(n1:end,1);    
        sigtemp = xls_data(n1:end,j);
        [~, ~,Rtemp,rmsetemp_,Stemp] = back_fun(t, sigtemp);
        R2_all(i,j-1) = Rtemp;
        rmse_all(i,j-1) = rmsetemp_;
        Xback_all(i,j-1) = Stemp;
%     eval(['T',num2str(i),'=','xls_data']);
    end
end
toc
figure;
plot(R2_all','-o')
legend({'FRCaMPitrace_looming.xlsx'
'SomaFRCaMPitrace_looming.xlsx'
'jRGECO1aitrace_looming.xlsx'})
xlabel('num')
ylabel('R^2')
title('Half Decay')
