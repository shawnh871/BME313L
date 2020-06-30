% BME313L_Lab6_P2_ShaoPoHuang
% This code will use the sucessive substitution method to determine the
% solutions for x and y in the given system of equations

% clear all variables and console, close all figures
clear; clc; close all

% initialize variables
x = 1.2;
y = 1.2;
es = 0.001; % pre-specified error
i = 0; % iteration counter

disp('  Iterations      X         Y        Ea_X      Ea_Y') % display table headings
fprintf('------------------------------------------------------\n') % display dashed line after headings

% Successive Substitution
while (1) % execute at least once before checking condition
    i = i + 1; % increment iteration counter
    
    y_new = (x^2)/(1+5*x); % calculate new y value
    x_new = sqrt(-y_new+x+0.5); % calculate new x value
    
    ea_y = abs((y_new-y)/y_new)*100; % calculate approximate percent relative error for y
    ea_x = abs((x_new-x)/x_new)*100; % calculate approximate percent relative error for x
    
    % print results of each iteration
    fprintf('      %d  %13.5f  %8.5f  %8.5f  %9.5f\n', i, x, y, ea_x, ea_y)
    
    % check stopping condition
    % if approximate percent relative error values for both x and y are
    % lower than the prespecified error, break out of while loop
    if ea_y<es && ea_x<es
        break
    end
    
    y = y_new; % update y value
    x = x_new; % update x value
    
end
