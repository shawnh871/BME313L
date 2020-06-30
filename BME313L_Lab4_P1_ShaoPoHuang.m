% BME313L_Lab4_P1_ShaoPoHuang
% This code will determine the lowest positive root of the given function
% using the Newton-Raphson method

clear; close all; clc;         % clear existing values/console
x = 0.3;                    % set initial guess to 0.3
N = 5;                      % set # of iterations to 5
T = zeros(5,5);             % create a 5x5 matrix of zeros
f = @(x) 7*sin(x)*exp(-x)-1;      % define function
df = @(x) 7*cos(x)*exp(-x)-7*sin(x)*exp(-x);    % define derivative of function
disp('  Iteration    xi+1      f(xi)    f''(xi)     |Ea|') % display table headings

for i = 1:N         % set index of for loop from 1 to N
xold = x;           % store old x value for ea calculation
fx = f(x);          % calculate fx at x
diff_fx = df(x) ;     % calculate f'x at x
x = x - fx/diff_fx;     % update x
ea = abs((x-xold)/x)*100;   % calculate approximate relative error
                    % place values in matrix for display
T(i,1) = i;         % first column: # of iterations
T(i,2) = x;         % second column: new 'x' value
T(i,3) = fx;        % third column: fx at x
T(i,4) = diff_fx;   % fourth column: f'x at x
T(i,5) = ea;        % fifth column: approximate relative error
end

disp(T);            % display results in table
fprintf('The lowest positive root of the function is %.4f.\n', x)  % output lowest possible root 

