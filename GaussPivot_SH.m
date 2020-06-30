function x = GaussPivot_SH(A,b)
% GaussPivot: Gauss elimination pivoting
% x = GaussPivot(A,b): Gauss elimination with pivoting.
% input:
% A = coefficient matrix
% b = right hand side vector
% output:
% x = solution vector
[m,n]=size(A);  % obtain size of matrix A
if m~=n, error('Matrix A must be square'); end % check if matrix A is square
nb=n+1; % number of columns after augmenting matrix b
Aug=[A b]; % augment matrices A and b

for k = 1:n-1 
    
    % partial pivoting
    [~,i]=max(abs(Aug(k:n,k))); % determine the row with highest value on primary diagonal
    ipr=i+k-1;  
    if ipr~=k   % check to see if highest value row is the current row
    Aug([k,ipr],:)=Aug([ipr,k],:);  % if not, switch the current row with the highest value row
    end
    
    % forward elimination
    for i = k+1:n 
    factor=Aug(i,k)/Aug(k,k); % calculate the factor to be multiplied to current row
    Aug(i,k:nb)=Aug(i,k:nb)-factor*Aug(k,k:nb);  % subtract product of current row and factor from following rows
    end
end

% back substitution
x=zeros(n,1); % create solutions matrix
x(n)=Aug(n,nb)/Aug(n,n); % calculate solution of the final variable 
for i = n-1:-1:1
x(i)=(Aug(i,nb)-Aug(i,i+1:n)*x(i+1:n))/Aug(i,i); % solve for each variable by substituting the previously determined variables
end