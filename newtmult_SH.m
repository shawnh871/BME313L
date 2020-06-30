function [x,f,ea,iter]=newtmult_SH(func,x0,es,maxit,varargin)
% newtmult_SH: Newton-Raphson root zeroes nonlinear systems
% [x,f,ea,iter]=newtmult(func,x0,es,maxit,p1,p2,...):
% uses the Newton-Raphson method to find the roots of
% a system of nonlinear equations
% input:
% func = name of function that returns f and J
% x0 = initial guess
% es = desired percent relative error (default = 0.0001%)
% maxit = maximum allowable iterations (default = 50)
% p1,p2,... = additional parameters used by function
% output:
% x = vector of roots
% f = vector of functions evaluated at roots
% ea = approximate percent relative error (%)
% iter = number of iterations
if nargin<2,error('at least 2 input arguments required'),end % checks if there are at least 2 inputs
if nargin<3||isempty(es),es=0.0001;end % if a third input is not provided, use default
if nargin<4||isempty(maxit),maxit=50;end % if a fourth input is not provided, use default
iter = 0; % intiialize iteration counter
x=x0; % set x equal to x0 from main script
while (1) % execute at least once before checking stop condition
[J,f]=func(x,varargin{:}); % call function that outputs J, f (receptor_ligand_SH)
% calculate the new x values
dx=(J\f)';
x=x-dx;
% increment iteration counter
iter = iter + 1;
% calculate approximate percent relative error
ea=100*max(abs(dx./x));
% check stopping condition: if maximum number of iterations have been
% performed or the approximate percent relative error is lower than
% pre-specified error, break out of while loop
if iter>=maxit||ea<=es, break, end
end