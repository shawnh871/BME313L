% BME313L_Lab10_P1_ShaoPoHuang
% This program will find the analytical value of the given integral as well
% several estimates using single trapezoid, composite trapezoid,
% Simpson's 1/3 Rule, Simpson's 3/8 Rule, and Boole's Rule approximations.

clear; clc; close all % clear variables, console; close all figures

a = -2; % lower bound
b = 4; % upper bound
f = @(x) 1 - x - 4*x^3 + 2*x^5; % original function

% Analytical

f_i = @(x) x - (x^2)/2 - x^4 + (x^6)/3; % integrated function
I_a = f_i(b) - f_i(a);

% display results
fprintf('The analytical value of the integral is %.4f.\n\n', I_a)

% Single Trapezoid

I_t = (b-a)*((f(a)+f(b))/2); % calculate approximation
Et_t = 100*abs((I_t-I_a)/I_a);  % calculate error

% display results
fprintf('The single trapezoid estimate of the integral is %.4f.\n', I_t)
fprintf('The true percent relative error of the single trapezoid estimate is %.4f%%.\n\n', Et_t)

% Composite Trapezoid
% call trap_SH using 9 and 19 segments
I_ct1 = trap_SH(f, a, b, 9);  % 10 points
I_ct2 = trap_SH(f, a, b, 19);  % 20 points

Et_ct1 = 100*abs((I_ct1-I_a)/I_a); % calculate error
Et_ct2 = 100*abs((I_ct2-I_a)/I_a); % calculate error

% display results
fprintf('The composite trapezoid (10 points) estimate of the integral is %.4f.\n', I_ct1)
fprintf('The true percent relative error of the composite trapezoid (10 points) estimate is %.4f%%.\n\n', Et_ct1)

fprintf('The composite trapezoid (20 points) estimate of the integral is %.4f.\n', I_ct2)
fprintf('The true percent relative error of the composite trapezoid (20 points) estimate is %.4f%%.\n\n', Et_ct2)

% Simpson's 1/3 Rule

I_S1 = (b-a)*(f(a)+4*f((a+b)/2)+f(b))/6; % calculate approximation
Et_S1 = 100*abs((I_S1-I_a)/I_a); % calculate error

% display results
fprintf('The Simpson''s 1/3 Rule estimate of the integral is %.4f.\n', I_S1)
fprintf('The true percent relative error of the Simpson''s 1/3 Rule estimate is %.4f%%.\n\n', Et_S1)

% Simpson's 3/8 Rule

I_S3 = (b-a)*(f(a)+3*(f(a+(b-a)/3)+f(b-(b-a)/3))+f(b))/8; % calculate approximation
Et_S3 = 100*abs((I_S3-I_a)/I_a); % calculate error

% display results
fprintf('The Simpson''s 3/8 Rule estimate of the integral is %.4f.\n', I_S3)
fprintf('The true percent relative error of the Simpson''s 3/8 Rule estimate is %.4f%%.\n\n', Et_S3)

% Boole's Rule

I_B = (b-a)*(7*(f(a)+f(b))+32*(f(a+(b-a)/4)+f(b-(b-a)/4))+12*f((a+b)/2))/90; % calculate approximation
Et_B = 100*abs((I_B-I_a)/I_a); % calculate error

% display results
fprintf('The Boole''s Rule estimate of the integral is %.4f.\n', I_B)
fprintf('The true percent relative error of the Boole''s Rule estimate is %.4f%%.\n', Et_B)
