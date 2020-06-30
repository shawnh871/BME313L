% BME313L_Lab8_P3_ShaoPoHuang
% This program will generate a plot of lifetime cancer risk vs. number of
% stem cell divisions using log-scale axes; it will also display the
% coefficient of determination using linear regression

clear; clc; close all % clear all variables and console, close all figures

% set up matrix for number of stem cell divisions (x)
x = [1.299e11 3.550e12 1.299e11 1.168e12 1.168e12 1.168e12 7.796e9 7.796e9 1.203e9 7.840e7 2.700e8 3.186e10 3.186e10 2.709e11 2.709e11 9.272e9 9.272e9 2.720e8 7.638e11 2.926e7 4.550e6 6.020e6 1.113e7 3.150e6 2.200e7 3.428e11 6.068e9 2.922e11 3.348e9 5.850e8 5.850e7];

% set up matrix for lifetime cancer risk (y)
y = [0.0041 0.3 0.0052 0.048 1 0.5 0.0003 0.035 0.00194 0.0028 0.00219 0.0138 0.07935 0.0071 0.071 0.0045 0.081 0.00011 0.0203 0.00035 0.00004 0.0000302 0.00022 0.00003 0.00041 0.01359 0.00019 0.0007 0.0037 0.01026 0.00032];

x_T = log10(x); % transformed x matrix
y_T = log10(y); % transformed y matrix
[a,r2] = linregr_SH(x_T, y_T); % call linregr function 
close all % close automatically generated figure

f = @(x) 10.^(a(2)+a(1)*log10(x)); % function handle for linear regression

% plot of lifetime cancer risk vs. number of stem cell divisions
loglog(x,y,'or') % create log-scale figure of original data points
hold on
fplot(f,'b') % plot linear regression
title('Total Stem Cell Divisions vs. Lifetime Risk of Cancer')
xlabel('Total Stem Cell Divisions')
ylabel('Lifetime Risk of Cancer')
hold off

% display the coefficient of determination (r^2)
fprintf('The coefficient of determination (r^2) of the linear least-squares regression is %.4f.\n', r2)