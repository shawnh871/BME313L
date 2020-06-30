% BME313L_Lab10_P2_ShaoPoHuang
% This program will use Romberg Integration, two-point Gauss-Legendre, and
% the quad/quadl functions to estimate the value of a given integral
% representing the force on a sailboat mast.

clear; clc; close all % clear variables, console; close all figures

a = 0; % lower bound
b = 30; % upper bound
es = 0.5; % pre-specified error
f = @(z) 100.*(z./(5+z)).*exp(-2.*z/b); % original function

% Romberg
[q, ea, iter] = romberg_SH(f,a,b,es); % call romberg_SH

% display results
i = 1:iter; 
T = table(i', q(1,2:4)', ea');
T.Properties.VariableNames = {'Iteration' 'Estimate' 'Error'};
disp(T)
disp(q)
fprintf('The final integral estimate using Romberg integration is %.4f.\n\n', q(1,4))

% Two-Point Gauss Legendre
f_t = @(z_t) 100*(15+15*z_t)/(5+15+15*z_t)*exp(-2*(15+15*z_t)/b)*15; % transformed function
I = f_t(-1/sqrt(3))+f_t(1/sqrt(3)); % Gauss-Legendre integration with given two-point function arguments

% display results
fprintf('The integral estimate using the two-point Gauss-Legendre is %.4f.\n', I)
fprintf('The variable transformation used was z = 15+15*z_t and dz = 15*dz_t.\n')
fprintf('The transformed function was 100*(15+15*z_t)/(5+15+15*z_t)*exp(-2*(15+15*z_t)/30)*15.\n\n')

% quad and quadl
q1 = quad(f,a,b,es);
q2 = quadl(f,a,b,es);

% display results
fprintf('The integral estimate using the quad function is %.4f.\n', q1)
fprintf('The integral estimate using the quadl function is %.4f.\n', q2)