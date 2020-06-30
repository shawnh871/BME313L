% BME313L_Lab6_P3_ShaoPoHuang
% This code will use the multivariable Newton-Raphson method to determine
% the fractional occupancy values of two different populations of receptors

% clear all variables and console, close all figures
clear; close all; clc

% initialize variables
xa_0 = 0.5;
xb_0 = 0.2;
x0 = [xa_0 xb_0];
es = 1;

% call newtmult function which calls receptor_ligand function
[x,f,ea,iter] = newtmult_SH(@receptor_ligand_SH,x0,es);

% print fractional occupancy values, approximate percent relative error,
% and number of iterations
fprintf('The fractional occupancy values, xa and xb, are %.4f and %.4f, respectively.\n', x)
fprintf('The approximate percent relative error at convergence is %.4f%%.\n', ea)
fprintf('The number of iterations required for convergence is %d.\n', iter)