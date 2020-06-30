% BME313L_Lab7_P3_ShaoPoHuang
% This program will calculate the eigenvalues and eigenvectors for a given
% system of equations relating Sr-90 concentration to time in five
% different lakes and generate a combined plot

clear; clc; close all; % clears variables and console, close all figures

k = 0.69315/28.8; % calculate first-order decay rate k

% set up A matrix
A = [(-0.0066-k) 0 0 0 0; 0 (-0.011-k) 0 0 0; 0.02002 0.01487 (-0.052-k) 0 0; 0 0 0.35597 (-0.396-k) 0; 0 0 0 0.13364 (-0.163-k)];

% set initial conditions
init = [17.7 30.5 43.9 136.3 30.1]';

% use eig function to find eigenvalues and eigenvectors
[evect,eval] = eig(A);

% find constants
c = evect\init;

% create function handles for y1, y2, y3, y4, y5
f1 = @(t) c(1)*evect(1,1)*exp(eval(1,1)*(t-1963))+c(2)*evect(1,2)*exp(eval(2,2)*(t-1963))+c(3)*evect(1,3)*exp(eval(3,3)*(t-1963))+c(4)*evect(1,4)*exp(eval(4,4)*(t-1963))+c(5)*evect(1,5)*exp(eval(5,5)*(t-1963));
f2 = @(t) c(1)*evect(2,1)*exp(eval(1,1)*(t-1963))+c(2)*evect(2,2)*exp(eval(2,2)*(t-1963))+c(3)*evect(2,3)*exp(eval(3,3)*(t-1963))+c(4)*evect(2,4)*exp(eval(4,4)*(t-1963))+c(5)*evect(2,5)*exp(eval(5,5)*(t-1963));
f3 = @(t) c(1)*evect(3,1)*exp(eval(1,1)*(t-1963))+c(2)*evect(3,2)*exp(eval(2,2)*(t-1963))+c(3)*evect(3,3)*exp(eval(3,3)*(t-1963))+c(4)*evect(3,4)*exp(eval(4,4)*(t-1963))+c(5)*evect(3,5)*exp(eval(5,5)*(t-1963));
f4 = @(t) c(1)*evect(4,1)*exp(eval(1,1)*(t-1963))+c(2)*evect(4,2)*exp(eval(2,2)*(t-1963))+c(3)*evect(4,3)*exp(eval(3,3)*(t-1963))+c(4)*evect(4,4)*exp(eval(4,4)*(t-1963))+c(5)*evect(4,5)*exp(eval(5,5)*(t-1963));
f5 = @(t) c(1)*evect(5,1)*exp(eval(1,1)*(t-1963))+c(2)*evect(5,2)*exp(eval(2,2)*(t-1963))+c(3)*evect(5,3)*exp(eval(3,3)*(t-1963))+c(4)*evect(5,4)*exp(eval(4,4)*(t-1963))+c(5)*evect(5,5)*exp(eval(5,5)*(t-1963));

% generate combined plot of y1, y2, y3, y4, and y5
fplot(f1, [1963 2011])
hold on
fplot(f2, [1963 2011])
fplot(f3, [1963 2011])
fplot(f4, [1963 2011])
fplot(f5, [1963 2011])
legend('Superior','Michigan','Huron','Erie','Ontario')
xlabel('Year')
ylabel('Concentration of Sr-90 (Bq/m^3)')
title('Concentration of Sr-90 vs. Year (1963-2011)')
hold off