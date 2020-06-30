% BME313L_Lab6_P1_ShaoPoHuang
% This code will use the Gauss-Siedel method to determine the four exit
% concentrations of drugs w, x, y, and z

% clear all variables and console, close all figures
clear; clc; close all

% Hy + Kw + Lx + Mz = F

% initialize variables
y = 2;
w = 7;
x = 30;
z = 30;
es = 8; % pre-specified error
i = 0; % iteration counter

disp('  Iteration     y         w         x         z') % display table headings
fprintf('----------------------------------------------------\n') % display dashed line after headings

% Gauss-Siedel Method
while(1) % execute at least once before checking condition
    i = i + 1; % increment iteration counter
    
    % calculate new values for y, w, x, z
    y_new = (6625-125*w-125*x-62.5*z)/100; 
    w_new = (5290-80*y_new-120*x-25*z)/110;
    x_new = (7300-140*y_new-80*w_new-100*z)/120;
    z_new = (6539-90*y_new-104.8*w_new-60*x_new)/137.33;
    
    % calculate approximate percent relative error for y, w, x, z
    ea_y = abs((y_new-y)/y_new)*100;
    ea_w = abs((w_new-w)/w_new)*100;
    ea_x = abs((x_new-x)/x_new)*100;
    ea_z = abs((z_new-z)/z_new)*100;
    
    % print results of each iteration
    fprintf('      %d  %11.4f %9.4f %9.4f %9.4f\n', i, y_new, w_new, x_new, z_new)
    
    % check stopping condition
    % if all approximate percent relative errors are lower than the
    % pre-specified error, break out of while loop
   if ea_y<es && ea_w<es && ea_x<es && ea_z<es 
       % print equations used to update variables in Gauss-Siedel method
       fprintf('\nThe equations used to update the variables using the Gauss-Siedel Method are as follows:\n\n')
       fprintf('y_new = (6625-125*w-125*x-62.5*z)/100\nw_new = (5290-80*y_new-120*x-25*z)/110\nx_new = (7300-140*y_new-80*w_new-100*z)/120\nz_new = (6539-90*y_new-104.8*w_new-60*x_new)/137.33\n\n')
       break
   end
   
   % update y, w, x, z values
   y = y_new;
   w = w_new;
   x = x_new;
   z = z_new;
   
end