function F = InvestWorth_SH(P,i,n) % three inputs
% F = InvestWorth_SH(P,i,n) calculates the future worth of an investment in
% dollars after 'n' years and puts the values into a table

m = (1:n)'; % creates a vertical array of values from 1 to n

F = P*(1+i).^m; % calculates F using values in array m
T = table(m,F); % makes a table of values for m and F

T.Properties.VariableNames={'Number_of_Years' 'Future_Worth'}; % headings of the columns in the table
disp(T); % display the table
end

