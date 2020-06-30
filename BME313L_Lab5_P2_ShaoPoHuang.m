% BME313L_Lab5_P2_ShaoPoHuang
% This code will use Gauss elimination to estimate the concentration of
% four different amino acids

clear; close all; clc; % clear console, variables, close figures

A = [11300 8150 4500 4000; 5000 7500 3650 4200; 1900 3900 3000 4800; 1500 1400 2000 4850]; % set up coefficients matrix
b = [0.6320; 0.5345; 0.3310; 0.1960];  % set up constants matrix

c = GaussPivot_SH(A,b); % call Gauss Pivot function

% displays table of amino acid concentrations in units of M
fprintf('Concentration of M(M)  Concentration of N(M)   Concentration of O(M)   Concentration of P(M)\n')
fprintf('-------------------------------------------------------------------------------------------\n')
fprintf('%15.8f     %18.8f     %19.8f      %18.8f\n', c')
