% BME313L_Lab1_Part2_ShaoPoHuang
% This program will 1) generate a vector of t values, 2) calculate
% corresponding x and y vectors, and 3) make two subplots: y and x vs t
% and y vs x

t = 0:1/16:100; % creates an array of values from 1 to 100 in intervals of 1/16
x = sin(t).*(exp(cos(t))-2*cos(4*t)-(sin(t/12)).^5);   % calculates x values for each t value
y = cos(t).*(exp(cos(t))-2*cos(4*t)-(sin(t/12)).^5);   % calculates y values for each t value

subplot(2,1,1)  % indicates first plot in a 2x1 (row x column) grid format
plot(t,x)   % starts a plot of x vs t
hold on   % waits for second variable to be plotted on the same plot
plot(t,y,':')   % plots y vs t with a dotted line on the same plot
title('X and Y Parametric Values vs Time')    % title of the first subplot
xlabel('time')  % x-axis label for the first subplot
ylabel('x and y parametric values')   % y-axis label for the first subplot
legend('x', 'y')    % makes a legend for the x and y data points in the first subplot
hold off   % indicates that the first plot is completed

subplot(2,1,2)  % indicates second plot in a 2x1 (row x column) grid format
plot(x,y)   % plots y vs x
axis square   % scales the graph to make the frame square
title('Y Parametric Values vs X Parametric Values') % title of the second subplot
xlabel('x parametric values') % x-axis label for the second subplot
ylabel('y parametric values') % y-axis label for the second subplot