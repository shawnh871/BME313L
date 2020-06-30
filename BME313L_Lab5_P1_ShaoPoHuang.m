% BME313L_Lab5_P1_ShaoPoHuang
% This code will solve a given system of equations using Gauss elimination
% and Cramer's rule

clear; close all; clc; % clear console, variables, close figures

A = [0 3 5; 4 1 1; 3 1 0];     % set up coefficients matrix
b = [1; 1; 2];         % set up constants matrix

xC = zeros(length(b), 1);   % initialize variables/solutions matrix
D = det(A);     % calculate determinant of coefficients matrix

for i=1:length(b)   % set up for loop for Cramer's Rule
    Ac = A;         % store original coefficient matrix in different variable
    Ac(:,i) = b;    % replace one of the columns of coefficients matrix with constants matrix
    Dn = det(Ac);   % calculate new determinant
    xC(i) = Dn/D;   % calculate solutions
end

xG = GaussPivot_SH(A, b);   % call Gauss Pivot function

bC = A*xC;  % calculate constants matrix using Cramer's Rule solutions
bG = A*xG;  % calculate constants matrix using Gauss Elimination solutions

if bC == b  % check if Cramer's Rule solutions match
    if round(bG,10) == b  % check if Gauss Elimination solutions match
        fprintf('The determinant of the given system of equations is %d.\n\n', D) % display determinant
        T = table(b, bC, bG, round(xC, 4), round(xG, 4));   % display data in table format
        T.Properties.VariableNames={'Given_b_Matrix' 'Cramer_b_Matrix' 'Gauss_b_Matrix' 'Cramer_Solutions_Matrix' 'Gauss_Solutions_Matrix'}; % table headings
        disp(T)  % display table
        fprintf('In the table, x1, x2, and x3 are displayed from top to bottom in the solutions matrices columns.\n')
        fprintf('The solutions obtained using Cramer''s Rule and Gauss Elimination match the expected solutions.\n') % display confirmation statement
    end
end


