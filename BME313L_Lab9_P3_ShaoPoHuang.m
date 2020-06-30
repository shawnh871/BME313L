% BME313L_Lab9_P3_ShaoPoHuang
% This program will calculate the vertical stresses for three different
% dimension conditions using Newton Interpolation. A plot of the linear
% and quadratic fits of the vertical stresses vs. aspect ratio will also be
% generated.

clear; clc; close all % clear variables and console; close figures

q = 100; % total load

% set up m and n matrices for each dimension (a and b) condition

% for a = 5.6 and b = 12
m1 = 0.4:0.1:0.7;
n1 = [0.10631 0.12626 0.14309 0.15703];

% for a = 4.8 and b = 14
m2 = 0.3:0.1:0.6;
n2 = [0.08561 0.10941 0.13003 0.14749];

% for a = 4.2 and b = 16
m3 = 0.3:0.1:0.6;
n3 = [0.08709 0.11135 0.13241 0.15027];

% estimate f(m,n) for each condition using Newton Interpolation
yint_1 = Newtint_SH(m1, n1, 0.56);
yint_2 = Newtint_SH(m2, n2, 0.48);
yint_3 = Newtint_SH(m3, n3, 0.42);

% calculate vertical stress for each condition
sigma1 = yint_1*q/(5.6*12);
sigma2 = yint_2*q/(4.8*14);
sigma3 = yint_3*q/(4.2*16);

y = [sigma1 sigma2 sigma3]; % store vertical stress in y vector
ar = [0.56/1.2 0.48/1.4 0.42/1.6]; % store aspect ratios in ar vector
p1 = polyfit(ar, y, 1); % find coefficients of linear fit
p2 = polyfit(ar, y, 2); % find coefficients of quadratic fit

x = linspace(0, 0.7, 50); % set up x vector
plot(x, p1(1)*x + p1(2)) % plot linear fit
hold on
plot(x, p2(1)*x.^2 + p2(2)*x+p2(3)) % plot quadratic fit
plot(ar, y, 'ok') % plot interpolated values
xlabel('Aspect Ratio (m/n)')
ylabel('Vertical Stress (metric tons/m^2)')
title('Vertical Stress vs. Aspect Ratio')
legend('Linear Fit', 'Quadratic Fit', 'Interpolated Values', 'location', 'southeast')
hold off

fprintf('The vertical stress when a = 5.6 and b = 12 is %.4f metric tons/m^2.\n', sigma1)
fprintf('The vertical stress when a = 4.8 and b = 14 is %.4f metric tons/m^2.\n', sigma2)
fprintf('The vertical stress when a = 4.2 and b = 16 is %.4f metric tons/m^2.\n', sigma3)
