% BME313L_Lab4_P2_ShaoPoHuang
% This code will 1) determine various Thiele moduli corresponding to
% different efficiency values and 2) make a plot relating these two
% variables

clear; close all; clc; % clear existing values/console

N = 0.3:0.1:0.6; % vector of N (efficiency values)
Es = 0.03; % pre-specified error criterion
mod = zeros(1,length(N)); % vector of roots
T = zeros();  % initialize T matrix for storing data

for Z = 1:length(N) % for loop with index of the number of efficiency values to run
i = 0;  % initialize iteration counter to 0
x = 1;  % set initial guess to 1
while (1)   % set up while loop to run at least once before checking condition
 xold  = x;         % store current x in xold
 del   = 0.05;      % initialize delta
 x_del = del*x;     % calculate delta*x 
 xi_del = x+x_del;  % calculate x+delta*x;
 
 fx     = (1/x)*((1/tanh(3*x))-1/(3*x))-N(Z); % calculate f(x)    
 fx_del = (1/xi_del)*((1/tanh(3*xi_del))-1/(3*xi_del))-N(Z); % calculate f(x+delta*x)
 
       i = i+1;     % increment iteration counter 
       x = x-(x_del*fx)/((fx_del)-fx); % update x value
       
       Ea =  abs((x-xold)/x)*100;   % calculate approximate percent relative error 
       
         % store values in matrix T
       T(i,1) = N(Z);    % efficiency values 
       T(i,2) = i;       % iteration numbers
       T(i,3) = x;       % new x values
       T(i,4) = xi_del;  % x + delta * x values
       T(i,5) = fx;      % f(x) values
       T(i,6) = fx_del;  % f(x+delta*x) values
       T(i,7) = Ea;      % approximate percent relative error values
       
       if Ea < Es   % check condition for breaking out of while loop
          mod(Z) = x;   % store root in mod vector
          disp('Efficiency Value    Iteration      xi+1        xi+del_xi         f(xi)         f(xi+del_xi)         |Ea|')
                % display headings for table
          fprintf('----------------------------------------------------------------------------------------------------------\n')
                % create a dashed line between headings and data
          fprintf('%10.4f %16.4f %12.4f %14.4f %14.4f %17.4f %16.4f\n', T')    % display data from matrix T in table
          fprintf('\n')     % (space out) put a line between each table
          clear T       % clear matrix T
          break     % exit while loop
       end      % end of the if statement
      
end   % end of the while loop
end   % end of the for loop

plot(N*100, mod)    % plot the modulus values vs. the efficiency values (%)
title('Thiele Modulus vs. Efficiency Value')    % title of plot
xlabel('Efficiency Value (%)')  % x-axis label
ylabel('Thiele Modulus')    % y-axis label
