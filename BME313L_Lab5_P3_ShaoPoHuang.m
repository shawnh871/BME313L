% BME313L_Lab5_P3_ShaoPoHuang
% This code will use the tridiagonal method to determine the yout and xout
% values associated with a five-stage reactor

clear; close all; clc;  % clear console, variables, close figures

% initialize given variables
F1 = 500;  % 500 kg/h
F2 = 900;  % 900 kg/h
xin = 0;
yin = 0.1;
K = 5;

a = -(1+F2*K/F1); % calculate coefficient for yi term
b = F2*K/F1;  % calculate coefficient for yi+1 term

A = [a b 0 0 0; 1 a b 0 0; 0 1 a b 0; 0 0 1 a b; 0 0 0 1 a]; % set up coefficient matrix
e = [0 1 1 1 1];  % set up first diagonal
f = [a a a a a];  % set up second diagonal
g = [b b b b 0];  % set up third diagonal
r = [-yin; 0; 0; 0; 0];  % set up constants matrix

T = Tridiag_SH(e,f,g,r); % call Tridiagonal function
G = GaussPivot_SH(A,r); % call Gauss Pivot function

youtT = T(5);  % determine yout value for tridiagonal
xoutT = T(1)*K;  % determine xout value for tridiagonal

youtG = G(5);  % determine yout value for Gauss pivot
xoutG = G(1)*K;  % determine xout value for Gauss pivot

if youtT == youtG   % check to see if yout values match
    if xoutT == xoutG   % check to see if xout values match
        % display final results
fprintf('The xout and yout values obtained from the Tridiagonal method are %.4f and %.8f, respectively.\n', xoutT, youtT)
fprintf('The xout and yout values obtained from the Gauss elimination method are %.4f and %.8f, respectively.\n', xoutG, youtG)
    end
end

