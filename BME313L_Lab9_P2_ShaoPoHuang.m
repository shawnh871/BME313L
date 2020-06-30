% BME313L_Lab9_P2_ShaoPoHuang
% This program will calculate and output estimations for f(4) using Newton
% and Lagrange Interpolation for the first through fourth orders.

clear; clc; close all  % clear console and variables; close figures

x = [1 2 3 5 6];  % set up x vector
y = [8 5 6.5 50 92];  % set up y vector

% estimate f(4) using Newton Interpolation for first through fourth orders
yint_N1 = Newtint_SH([x(3) x(4)], [y(3) y(4)], 4);
yint_N2 = Newtint_SH([x(2) x(3) x(4)], [y(2) y(3) y(4)], 4);
yint_N3 = Newtint_SH([x(2) x(3) x(4) x(5)], [y(2) y(3) y(4) y(5)], 4);
yint_N4 = Newtint_SH(x, y, 4);

% store Newton estimations in vector
y_NT = [yint_N1; yint_N2; yint_N3; yint_N4];

% estimate f(4) using Lagrange Interpolation for first through fourth
% orders
yint_L1 = Lagrange_SH([x(3) x(4)], [y(3) y(4)], 4);
yint_L2 = Lagrange_SH([x(2) x(3) x(4)], [y(2) y(3) y(4)], 4);
yint_L3 = Lagrange_SH([x(2) x(3) x(4) x(5)], [y(2) y(3) y(4) y(5)], 4);
yint_L4 = Lagrange_SH(x, y, 4);

% store Lagrange estimations in vector
y_LT = [yint_L1; yint_L2; yint_L3; yint_L4];

% set up order vector
order = [1; 2; 3; 4];

% display results in table
T = table(order, y_NT, y_LT);
T.Properties.VariableNames = {'Order' 'Newton' 'Lagrange'};
disp(T)




