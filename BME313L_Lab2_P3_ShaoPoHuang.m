% BME313L_Lab2_P3_ShaoPoHuang
% This program will 1) make four plots in the same graph for the three
% types of finite difference approximations and the theoretical difference
% and 2) generate a table of approximations and errors for each
% approximation type

h = 0.25; % initializes 'h' as a scalar equal to 0.25
x = -2:h:2; % initializes 'x' as an array of values from -2 to 2 with increments of 'h'
L = (2-(-2))/h + 1; % calculates the value of 'L'
i = 1; % initializes 'i' as a scalar equal to 1

% initializes y1, y2, y3, y4, y5, y6, y7, Eb, Ec, and Ef as arrays with 'L'
% number of zeros
y1 = zeros(1,L); 
y2 = zeros(1,L);
y3 = zeros(1,L);
y4 = zeros(1,L);
y5 = zeros(1,L);
y6 = zeros(1,L);
y7 = zeros(1,L);
Eb = zeros(1,L);
Ec = zeros(1,L);
Ef = zeros(1,L);

for a = -2:h:2 % for loop with index 'a' running from -2 to 2 at increments of 'h'
    
    first= 3*a^3-2*a+6; % calculates first (current) data point 
    next= 3*(a+h)^3-2*(a+h)+6; % calculates next data point
    prev = 3*(a-h)^3-2*(a-h)+6; % calculates previous data point
    
    % Forward
    y_f = (next - first)/h; % calculates forward difference approximations
    y1(i) = y_f; % stores forward approximations in y1
    
    % Centered
    y_c = (next - prev)/(2*h); % calculates centered difference approximations
    y2(i) = y_c; % stores centered approximations in y2
    
    % Backward
    y_b = (first - prev)/h; % calculates backward difference approximations
    y3(i) = y_b; % stores backward approximations in y3
    
    % Derivative
    f1 = 9*a^2-2; % calculates true derivative values
    y4(i) = f1; % stores derivative values in y4
    
    % Original Data Points
    y5(i) = first; % stores first (current) data points
    y6(i) = prev; % stores previous data points
    y7(i) = next; % stores next data points
    
    i = i+1;  % increment matrix index
end % ends for loop

for b = 1:L % for loop with index 'b' running from 1 to 'L'
    Eb(b) = 100*abs((y4(b)-y3(b))/y4(b)); % calculates and stores backward true relative errors in 'Eb'
    Ec(b) = 100*abs((y4(b)-y2(b))/y4(b)); % calculates and stores centered true relative errors in 'Ec'
    Ef(b) = 100*abs((y4(b)-y1(b))/y4(b)); % calculates and stores forward true relative errors in 'Ef'
end % ends for loop

plot(x, y4, 'k', 'LineWidth', 2) % plots y4 vs x
hold on % retains existing graph
plot(x, y1, '--r', 'LineWidth', 2) % plots y1 vs x
plot(x, y2, '-.g', 'LineWidth', 2) % plots y2 vs x
plot(x, y3, ':b', 'LineWidth', 2) % plots y3 vs x
title('f''(x) Difference Approximations vs X Values') % title of plot
xlabel('X Values') % x-axis label
ylabel('f ''(x) Difference Approximation Values') % y-axis label
legend('Theoretical Difference', 'Forward Difference', 'Centered Difference', 'Backward Difference') % plot legend
hold off % terminates graphing process for existing plot

t = {'x' 'f(x)' 'f(x-1)' 'f(x+1)' 'f''(x)theory' 'f''(x)back' 'Eback(%)' 'f''(x)cent' 'Ecent(%)' 'f''(x)forw' 'Eforw(%)'}; % sets column headings for table
fprintf('   %s   ', t{1:end}); % prints column headings with equal spacing in table 
fprintf('\n----------------------------------------------------------------------------------------------------------------------------------------------\n');
    % prints dashed line under column headings
T = [x; y5; y6; y7; y4; y3; Eb; y2; Ec; y1; Ef]; % concatenates x, y1-7, Eb, Ec, and Ef arrays in 'T' matrix
fprintf('%6.3f %8.3f %10.3f %11.3f %13.3f %16.3f %13.3f %13.3f %13.3f %14.3f %14.3f\n', T); % prints elements in 'T' matrix in table format

