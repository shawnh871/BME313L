function [root,fx,ea,iter]=falsepos_SH(func,xl,xu,es,maxit,varargin)
% falsepos: root location zeroes
% [root,fx,ea,iter]=falsepos(func,xl,xu,es,maxit,p1,p2,...):
% uses false position method to find the root of func
% input:
% func = name of function
% xl, xu = lower and upper guesses
% es = desired relative error (default = 0.0001%)
% maxit = maximum allowable iterations (default = 50)
% p1,p2,... = additional parameters used by func
% output:
% root = real root
% fx = function value at root
% ea = approximate relative error (%)
% iter = number of iterations

if nargin<3     % if there are less than the 3 required input arguments (func, xl, xu)
    error('at least 3 input arguments required')    % display an error message
end

test = func(xl,varargin{:})*func(xu,varargin{:}); % otherwise, test to see if there is a sign change

if test>0       % if the test is positive, then there is no possible root
    error('no sign change')     % display error message
end

if nargin<4||isempty(es)    % if a desired relative error is not provided 
    es=0.0001;      % use default error limit
end

if nargin<5||isempty(maxit)     % if a maximum # of iterations is not provided
    maxit=50;   % use default maximum # of iterations
end

% Initialization
iter = 0; 
xr = xl; 
ea = 100; 

while(1)
  xrold = xr;  % set the preexisting xrold value as xr            
  xr = xu - ((func(xu, varargin{:}))*(xl-xu))/((func(xl, varargin{:})-func(xu, varargin{:})));
    % calculate new xr value as the point where the line connecting xl and xu intersect
    % with the x-axis
  iter = iter + 1;    % increment iterations counter      
 
  if xr ~= 0    % xr must not equal 0 in order to calculate ea, update relative error
      ea = abs((xr-xrold)/xr)*100;    % calculate approximate percent relative error
  end    
  
  test = func(xl,varargin{:})*func(xr,varargin{:}); % test to see if there is a sign change
  
  if test < 0              % if the test is negative, upper guess too big
    xu = xr;               % change upper guess to xr
  elseif test > 0          % if the test is positive, lower guess too small 
    xl = xr;               % change lower guess to xr
  else                     % solution found
    ea = 0;                % set approximate relative error to 0
  end
                           % check exiting conditions: 
  if ea <= es || iter >= maxit  % stop if error small enough or too many iterations
      break
  end     
end

root = xr;         % output best guess/found root
fx = func(xr, varargin{:});     % verify f(xr) close to 0
    