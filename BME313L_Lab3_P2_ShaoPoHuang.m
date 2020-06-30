% BME313L_Lab3_P2_ShaoPoHuang
% This program will 1) determine the required solenoid radius (a), 2) report
% the final approximate error, 3) report the number of iterations ran by
% the false position function and the bisection function

u = 4*pi*1e-9; % set permeability of free space in H/cm
N = 20; %  set number of turns
l = 30; % set solenoid length in cm
L = 3e-6; % set solenoid inductance in H

f = @(a) ((u*(N^2)*pi*(a^2))/(l^2))*((l^2+a^2)^(1/2)-a)-L; % primary function: f(a)
[r, Fx, Ea, i] = falsepos_SH(@(a) f(a), 0, 100, 0.0001, 500); % calls false position function to determine roots of f(a)
[root, fx, ea, iter] = bisect_SH(@(a) f(a), 0, 100, 0.0001, 100); % calls bisection function to determine roots of f(a)

fprintf('The required radius of the solenoid coil is %.4f centimeters.\n', r) % display required radius value (determined by false position function)
fprintf('The final approximate percent relative error is %.6f%%.\n', Ea) % display final approximate percent relative error
fprintf('The number of iterations needed for the false position method is %d.\n', i) % display number of iterations for false position method
fprintf('The number of iterations needed for the bisection method is %d.\n', iter) % display number of iterations for bisection method
