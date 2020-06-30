function [a, r2] = linregr_SH(x,y)
% linregr: linear regression curve fitting
%   [a, r2] = linregr(x,y): Least squares fit of straight
%           line to data by solving the normal equations
% input:
%   x = independent variable
%   y = dependent variable
% output:
%   a = vector of slope, a(1), and intercept, a(2)
%   r2 = coefficient of determination

    n = length(x); % number of data values
    
    % check for matching number of data values
    if length(y)~=n 
        error('x and y must be same length'); 
    end

    % convert to column vectors
    x = x(:); 
    y = y(:); 

    sx = sum(x); % sum of x values
    sy = sum(y); % sum of y values
    sx2 = sum(x.*x); % sum of x^2 values
    sxy = sum(x.*y); % sum of x*y values
    sy2 = sum(y.*y); % sum of y^2 values
    
    % y = a0 + a1x + e
    a(1) = (n*sxy-sx*sy)/(n*sx2-sx^2); % calculate a1 (slope)
    a(2) = sy/n-a(1)*sx/n; % calculate a0 (y-intercept)
    r2 = ((n*sxy-sx*sy)/sqrt(n*sx2-sx^2)/sqrt(n*sy2-sy^2))^2; % calculate r^2

    % create plot of data and best fit line
    xp = linspace(min(x),max(x),2);
    yp = a(1)*xp+a(2);
    plot(x,y,'or',xp,yp)
    grid on