function yint = Newtint_SH(x,y,xx)
% Newtint: Newton interpolating polynomial
% yint = Newtint(x,y,xx): Uses an (n - 1)-order Newton
% interpolating polynomial based on n data points (x, y)
% to determine a value of the dependent variable (yint)
% at a given value of the independent variable, xx.
% input:
% x = independent variable
% y = dependent variable
% xx = value of independent variable at which
% interpolation is calculated
% output:
% yint = interpolated value of dependent variable
% compute the finite divided differences in the form of a
% difference table
n = length(x); % set n as the number of data points
if length(y)~=n, error('x and y must be same length'); end % check for complete data set
b = zeros(n,n); % initialize matrix of zeros
% assign dependent variables to the first column of b.
b(:,1) = y(:); % the (:) ensures that y is a column vector.

% calculate the finite divided differences (b) for each order
for j = 2:n
    for i = 1:n-j+1
        b(i,j) = (b(i+1,j-1)-b(i,j-1))/(x(i+j-1)-x(i));
    end
end

xt = 1; % initialize variable for (x-xi) products to 1
yint = b(1,1); % initialize variable for function value to b1

% use the finite divided differences (b) to interpolate
for j = 1:n-1
    xt = xt*(xx-x(j));
    yint = yint+b(1,j+1)*xt; 
end