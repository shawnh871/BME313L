% BME313L_Lab9_P1_ShaoPoHuang
% This program will find the third and fourth-order estimations of the
% Bessel function at x = 3.1. A plot of the Bessel function and the
% interpolating polynomials will also be generated.

clear; clc; close all  % clear console and variables; close figures

x = [2.2 2.4 2.6 2.8 3.0];  % set up x vector
y = [0.6815 0.6767 0.6560 0.6202 0.5708]; % set up y vector

p3 = polyfit(x, y, 3); % find coefficients of third-order polynomial
y3 = polyval(p3, 3.1); % find function value at x = 3.1 for third-order polynomial
p4 = polyfit(x, y, 4); % find coefficients of fourth-order polynomial
y4 = polyval(p4, 3.1); % find function value at x = 3.1 for fourth-order polynomial

J = besselj(1, 3.1); % find true value of Bessel function at x = 3.1
e3 = 100*abs((y3-J)/J); % find true percent relative error for third-order estimation
e4 = 100*abs((y4-J)/J); % find true percent relative error for fourth-order estimation

xb = linspace(-3.1, 3.1, 50); % set up x vector for plotting
yb = besselj(1, xb); % find function values of Bessel function
yp3 = polyval(p3, xb); % find function values of third-order polynomial
yp4 = polyval(p4, xb); % find functino values of fourth-order polynomial
plot(xb,yb) % plot Bessel function
hold on
plot(xb, yp3) % plot third-order polynomial
plot(xb, yp4) % plot fourth-order polynomial
plot(x, y, 'ok') % plot original data points
xlabel('x')
ylabel('J(x)')
title('Zero-Order Bessel Function of the First Kind')
legend('Bessel Function', 'Third-Order Interpolation', 'Fourth-Order Interpolation', 'Original Points')

% display results
fprintf('The true Bessel function value at x = 3.1 is %.4f.\n', J)
fprintf('The third and fourth-order estimations for the zero-order Bessel function of the first kind at x = 3.1 were %.4f and %.4f, respectively.\n', y3, y4) 
fprintf('The true percent relative error of the third and fourth-order estimations were %.4f%% and %.4f%%, respectively.\n', e3, e4)