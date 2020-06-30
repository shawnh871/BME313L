% BME313L_Lab7_P2_ShaoPoHuang
% This program will determine the eigenvalues and eigenvectors for a given
% system of equations and plot the solutions

clear; clc; close all; % clears variables and console, close all figures

A = [-5 3; 100 -301]; % set up A matrix
y = [80;160]; % set initial conditions

% use eig function to find eigenvalues and eigenvectors
[evect,eval] = eig(A); 

% find constants
c = evect\y;

% display eigenvectors, eigenvalues, and general solutions
fprintf('The first eigenvector is:\n\n')
disp(evect(:,1))
fprintf('The second eigenvector is:\n\n')
disp(evect(:,2))
fprintf('The first eigenvalue is %.4f.\n', eval(1,1))
fprintf('The second eigenvalue is %.4f.\n', eval(2,2))
fprintf('The general solution for y1 is y1 = %4f*e^(%4ft)%4f*e^(%4f*t)\n', c(1)*evect(1,1), eval(1,1), c(2)*evect(1,2), eval(2,2))
fprintf('The general solution for y2 is y2 = %4f*e^(%4ft)+%4f*e^(%4f*t)\n', c(1)*evect(2,1), eval(1,1), c(2)*evect(2,2), eval(2,2))

% create function handles for y1 and y2
f1 = @(t) c(1)*evect(1,1)*exp(eval(1,1)*t)+c(2)*evect(1,2)*exp(eval(2,2)*t);
f2 = @(t) c(1)*evect(2,1)*exp(eval(1,1)*t)+c(2)*evect(2,2)*exp(eval(2,2)*t);

% generate combined plot of y1 and y2
fplot(f1, [0 1])
hold on
fplot(f2, [0 1])
legend('y1','y2')
xlabel('time')
ylabel('y')
title('Y vs. Time')
hold off






