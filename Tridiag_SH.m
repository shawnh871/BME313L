function x = Tridiag_SH(e,f,g,r)
% Tridiag: Tridiagonal equation solver banded system
% x = Tridiag(e,f,g,r): Tridiagonal system solver.
% input:
% e = subdiagonal vector
% f = diagonal vector
% g = superdiagonal vector
% r = right hand side vector
% output:
% x = solution vector
n=length(f); % set n equal to the length of vector f
% forward elimination 
for k = 2:n 
factor = e(k)/f(k-1); % calculate the factor for forward elimination
f(k) = f(k) - factor*g(k-1); % subtract product of top diagonal and factor from middle diagonal
r(k) = r(k) - factor*r(k-1); % subtract product of previous constant and factor from current constant
end
% back substitution
x(n) = r(n)/f(n);  % determine value of last variable 
for k = n-1:-1:1 
x(k) = (r(k)-g(k)*x(k+1))/f(k); % determine value of each variable by substituting previously determined values
end