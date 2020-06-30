% BME313L_Lab7_P1_ShaoPoHuang
% This program will determine the highest eigenvalue and the corresponding
% eigenvector and normalized eigenvector for a given matrix

clear; clc; close all; % clears variables and console, close all figures

A = [3 6 10; 6 4 8; 10 8 7]; % set up A matrix
es = 1; % set pre-specified error limit
maxit = 100; % set maximum number of iterations

% call powereig function
[evect, eval_T, ea_T, iter] = powereig_SH(A, es, maxit);

% create an array of iteration values
i = 1:iter;

% create table of results
T = table(i',eval_T',ea_T');
T.Properties.VariableNames={'Iteration' 'Eigenvalues' 'Ea'};

% display table
disp(T)

% display highest eigenvalue
fprintf('The highest eigenvalue is:\n')
disp(eval_T(iter))

% display normalized eigenvector
fprintf('The normalized eigenvector is:\n')
disp(evect)

% display eigenvector
fprintf('The eigenvector is:\n')
disp(evect.*eval_T(iter))


