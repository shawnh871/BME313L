% BME313L_Lab3_P3_ShaoPoHuang
% This program will 1) make a plot of f(P) vs P to help determine
% reasonable upper and lower guesses and 2) determine the necessary
% persistence time (P)

 S = 20; % set root mean squared cell speed in micrometers/minute
 d2 = 5e5; % set mean squared displacement in micrometers^2
 t = 180; % set time interval in minutes
 
f = @(P) 2*(S^2)*(P.*t-(P.^2).*(1-exp(-t./P)))-d2; % primary function: f(P)
fplot(f, [0 50]) % plot of f(P)
title('f(P) vs. P') % title of plot
xlabel('P (minutes)') % x-axis label
ylabel('f(P)') % y-axis label
[root, fx, ea, iter] = bisect_SH(@(P) f(P), 0, 10); % calls bisection function to determine roots of f(a)

fprintf('The persistence time needed is %.4f minutes.\n', root) % display persistence time needed
fprintf('The number of iterations required is %d.\n', iter) % display number of iterations required to converge to root

 
 