% BME313L_Lab4_P3_ShaoPoHuang
% This code will determine the distance away from the point source of laser
% where the light intensity drops to 30% of that of the source

clear; close all; clc  % clear existing values/console

mu_a    = 0.1;  % sets tissue absorption coefficient to 0.1 cm^-1
mu_s    = 100;  % sets scattering coefficient to 100 cm^-1
g       = 0.9;  % sets anistropy of the medium to 0.9
D       = (mu_a+mu_s*(1-g))/3;  % calculates value of D
delta   = (D/mu_a)^(1/2);   % calculates penetration depth

xi_back =  0.12;  % Sets one initial guess
xi   =  0.13;  % Sets the other initial guess
Es   =  0.01;  % Sets pre-specified error criterion  
i    =  0;     % Sets iteration counter to 0
T = zeros(); % initialize T matrix for storing data

fprintf(' Iteration       xi         xi_back       f(xi)      f(xi_back)       |Ea|\n') % creates headings for table
fprintf('---------------------------------------------------------------------------\n') % creates dashed line between data and headings
      
 while (1) % set up while loop to run at least once before checking condition
       fxi_back   =  ((exp(-xi_back/delta))/((4*pi*D)*xi_back))-0.3; % f(x) using first guess
       fxi     =  ((exp(-xi/delta))/((4*pi*D)*xi))-0.3; % f(x) using second guess
       
       xold_back = xi_back; % stores first guess xi_back in xold
       
       xi_back = xi;    % stores second guess in first (old) guess
       xi = xi - (fxi*(xold_back-xi))/(fxi_back-fxi); % update second (new) guess
       
       Ea = abs((xi-xi_back)/xi)*100; % calculate approximate percent relative error  
       i = i+1;  % increment iteration counter
       
       % store values in matrix T
       T(i,1) = i;  % iteration number
       T(i,2) = xi; % new guess
       T(i,3) = xi_back;    % old guess
       T(i,4) = fxi;    % function value at new guess
       T(i,5) = fxi_back;    % function value at old guess
       T(i,6) = Ea;   % approximate percent relative error
       
       if Ea < Es  % check condition for breaking out of while loop
          root = xi; % store root value
          fprintf('%8.4f %12.4f %12.4f %12.4f %13.4f %13.4f\n', T') % display data from matrix T
          fprintf('\n The distance away where the light intensity drops to 30%% is %.4f cm.\n', root) % output final distance
          break % exit while loop
       end % end of the if statement
       
 end % end of while loop