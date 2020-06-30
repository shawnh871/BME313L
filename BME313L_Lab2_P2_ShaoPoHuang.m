% BME313L_Lab2_P2_ShaoPoHuang
% This program will 1) generate a table of terms and errors for a MacLaurin
% series approximation of cos(pi/4) and 2) print out the number of terms
% needed to satisfy a specified error criterion

x = pi/4; % initializes 'x' as a scalar equal to pi/4
n = 4; % initializes 'n' as a scalar equal to 4
Es = (0.5*10^(2-n)); % sets an equation for calculating Es
k = 1; % initializes 'k' as a scalar equal to 1
Ea = 1; % initializes 'Ea' as a scalar equal to 1
Et = 1; % initializes 'Et' as a scalar equal to 1
Snew = 0; % initializes 'Snew' as a scalar equal to 0
rsum = zeros(20,1); % initializes 'rsum' as an array with 20 zeros
EtM = zeros(20,1); % initializes 'EtM' as an array with 20 zeros
EaM= zeros(20,1); % initializes 'EaM' as an array with 20 zeros

while Ea >= Es % while loop; exits when Ea < Es
Sold = Snew; % set current sum 'Sold'
T = ((-1)^(k-1))*(x^(2*(k-1)))/factorial(2*(k-1)); % equation for calculating each term in MacLaurin Series
Snew = Sold + T; % calculate new sum 'Snew'
rsum(k) = Snew; % store new sum values into 'rsum' array
Ea = 100*abs((Snew - Sold)/(Snew)); % calculate approximate error values 'Ea'
EaM(k) = Ea; % store 'Ea' values into 'EaM' array
Et = 100*abs((cos(x)-Snew)/(cos(x)));  % calculate true relative error values 'Et'
EtM(k) = Et; % store 'Et' values into 'EtM' array
k = k+1; % increment matrix and term index
end % ends while loop

terms = (1:k-1)'; % creates vertical vector for term index for display in table
EaM(1) = NaN; % sets first element in 'EaM' array as 'NaN'

T = table(terms, rsum(1:k-1), EtM(1:k-1), EaM(1:k-1)); % creates table
T.Properties.VariableNames = {'Terms' 'Result' 'True_Percent_Relative_Error' 'Approximate_Percent_Relative_Error'};
    % creates column headings in the table
disp(T) % displays table
fprintf('The number of terms required is %d.\n', k-1) % prints the number of terms required





