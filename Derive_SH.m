function [d] = Derive_SH(y,h)
% Derive_SH will use three different finite divided differences to
% approximate the derivative of a given set of data points
% Improved forward finite difference will be used on the first point
% Improved backward finite difference will be used on the last point
% Centered finite difference will be used for all intermediate points
% y = vector of y values
% h = step size
% d = vector of finite divided differences

i = 1; % initialize iteration counter

% improved forward finite difference for the first point
d(i) = (-y(i+2)+4*y(i+1)-3*y(i))/(2*h); 

% centered finite difference for all intermediate points
for i = 2:(length(y)-1)
    d(i) = (y(i+1)-y(i-1))/(2*h);
end

i = i+1; % increment iteration counter

% improved backward finite difference for the last point
d(i) = (3*y(i)-4*y(i-1)+y(i-2))/(2*h);

end

