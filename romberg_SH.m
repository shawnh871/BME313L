function [q,Error,iter] = romberg_SH(func,a,b,es,maxit,varargin)
% romberg: Romberg integration quadrature
% q = romberg(func,a,b,es,maxit,p1,p2,...):
% Romberg integration.
% input:
% func = name of function to be integrated
% a, b = integration limits
% es = desired relative error (default = 0.000001%)
% maxit = maximum allowable iterations (default = 30)
% pl,p2,... = additional parameters used by func
% output:
% q = integral estimate
% ea = approximate relative error (%)
% iter = number of iterations

% check for function, upper bound and lower bound
if nargin<3,error('at least 3 input arguments required'),end

% if third input is not given, set desired error to default of 0.000001%
if nargin<4||isempty(es), es=0.000001; end

% if fourth input is not given, set maximum iterations to default of 50
if nargin<5||isempty(maxit), maxit=50; end

n = 1; % initialize number of segments
I(1,1) = trap_SH(func,a,b,n,varargin{:}); % call trap function for 1 segment
iter = 0; % initialize iteration counter

% while loop for performing Romberg integration
while iter<maxit 
iter = iter+1; % increment iteration counter
n = 2^iter; % determine number of segments
I(iter+1,1) = trap_SH(func,a,b,n,varargin{:}); % call trap function based on number of segments

% for loop for evaluating successive integral estimations
for k = 2:iter+1
j = 2+iter-k;
I(j,k) = (4^(k-1)*I(j+1,k-1)-I(j,k-1))/(4^(k-1)-1); % general form of the Romberg integration
    % puts more weight on the superior integral estimates
end
ea = abs((I(1,iter+1)-I(2,iter))/I(1,iter+1))*100; % calculate approximate error
Error(iter) = ea; % store approximate error

% if approximate error is less than desired error, break out of while loop
if ea<=es, break; end 
end
q = I; % output matrix of integral estimates