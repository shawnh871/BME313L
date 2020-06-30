% BME313L_Lab8_P1_ShaoPoHuang
% This program will evaluate the constants a and b in a given power model
% and make plots of the linearized and power models

clear; clc; close all  % clear all variables and console, close all figures

W = [70 75 77 80 82 84 87 90];  % set up weight (W) matrix
A = [2.10 2.12 2.15 2.20 2.22 2.23 2.26 2.30];  % set up surface area (A) matrix

W_T = log10(W); % transformed W matrix
A_T = log10(A); % transformed A matrix

% plot of linearized model
figure(1) 
[c,r2] = linregr_SH(W_T, A_T); % call linregr function
title('log(A) vs. log(W) for Linearized Model')
xlabel('log(W) (log(kg))')
ylabel('log(A) (log(m^2))')
legend('Log(original data)', 'Linear Regression', 'Location', 'southeast')

% determine constants a and b based on linear coefficients in matrix c
a = 10^(c(2));
b = c(1);
fprintf('The constants, a and b, of the power model were found to be %.4f and %.4f, respectively.\n', a, b)

f = @(W) a.*W.^b; % function handle for power model
Af = f(95); % power model prediction of surface area of 95-kg person
fprintf('Based on the power model, the surface area of a 95-kg person is predicted to be %.4f m^2.\n', Af) % display prediction

% plot of power model with original data points
figure(2)
scatter(W,A,'or') % plot original data points
hold on
fplot(f, [50 100], 'b') % plot power model
grid on
title('A vs. W for Power Model')
xlabel('W (kg)')
ylabel('A (m^2)')
legend('Original Data', 'Power Regression', 'Location', 'southeast')
hold off




