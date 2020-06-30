% BME313_Lab8_P2_ShaoPoHuang
% This program will use the general linear least squares model to evaluate
% parameters a, b, c, and d and make plots of the ion products and squared
% residuals versus temperature

clear; clc; close all % clear all variables and console, close all figures

K = [1.164e-15; 2.95e-15; 6.846e-15; 1.467e-14; 2.929e-14]; % set up ion products (K) matrix
T = [1; 10; 20; 30; 40]; % set up temperature (T) matrix
Kw = zeros(); % initialize matrix for predicted ion products (Kw)

% define basis functions z0, z1, and z2 for Z matrix
z0 = 1./T; 
z1 = log10(T);
z2 = T;

% set up Z matrix
Z = [z0 z1 z2 ones(size(T))];

% solve for parameters and store in vector a
a = Z\(-log10(K));

% determine predicted ion product values and store in matrix Kw
for i = 1:length(T)
Kw(i) = (10^-(a(1)*z0(i) + a(2)*z1(i) + a(3)*z2(i) + a(4)));
end

% plot of predicted ion products of water vs. absolute temperature
figure(1)
plot(T, Kw,'-o')
title('Predicted Ion Products of Water vs. Absolute Temperature')
ax = gca;
ax.TitleFontSizeMultiplier = 0.9;
xlabel('Absolute Temperature (K)')
ylabel('Predicted Ion Products of Water')

% calculate square residual values and store in matrix Kr
Kr = (K - Kw').^2;

% plot of square residual values vs. absolute temperature
figure(2)
plot(T,Kr,'-o')
title('Squared Residuals vs. Absolute Temperature')
xlabel('Absolute Temperature (K)')
ylabel('Squared Residuals')

% display parameters and basis functions
fprintf('The parameters a, b, c, and d are as follows:\n\n')
fprintf('a = %.4f\nb = %.4f\nc = %.4f\nd = %.4f\n\n', a(1), a(2), a(3), a(4))
fprintf('The basis functions for the Z matrix are z0 = 1/T, z1 = log10(T), z2 = T, and z3 = 1.\n') 



