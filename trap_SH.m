function I = trap_SH(func,a,b,n,varargin)
% trap: composite trapezoidal rule quadrature
% I = trap(func,a,b,n,pl,p2,...):
% composite trapezoidal rule
% input:
% func = name of function to be integrated
% a, b = integration limits
% n = number of segments (default = 100)
% pl,p2,... = additional parameters used by func
% output:
% I = integral estimate

% check for function, lower bound, and upper bound
if nargin<3,error('at least 3 input arguments required'),end

% check if upper and lower bounds are valid
if ~(b>a),error('upper bound must be greater than lower'),end

% if fourth input is not given, set number of segments to default of 100
if nargin<4|isempty(n),n=100;end

x = a; h = (b - a)/n; % set initial value (lower bound) for x; calculate segment width

% find s where s = f(a)+2*sum(f(xi))+f(b)
s=func(a,varargin{:});
for i = 1 : n-1
x = x + h;
s = s + 2*func(x,varargin{:});
end
s = s + func(b,varargin{:});

% calculate integral estimate for composite trapezoid
I = (b - a) * s/(2*n);