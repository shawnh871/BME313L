% BME313L_Lab11_P2_ShaoPoHuang
% This program will generate a single plot of the improved forward/backward/centered 
% and centered difference approximations of a given function.

clear; clc; close all % clear variables and console; close all figures

x = 2; % x value
h = 0.5:-0.01:0.01; % vector of step sizes
f = @(x) exp(-2*x)-x; % original function

% initialize column vectors for finite difference approximations
impfor = zeros(length(h),1); % improved forward
impback = zeros(length(h),1); % improved backward
cent = zeros(length(h),1); % centered
impcent = zeros(length(h),1); % improved centered

% calculate finite difference approximations
for i = 1:length(h)
impfor(i) = (-f(x+2*h(i))+4*f(x+h(i))-3*f(x))/(2*h(i)); % improved forward
impback(i) = (3*f(x)-4*f(x-h(i))+f(x-2*h(i)))/(2*h(i)); % improved backward
cent(i) = (f(x+h(i))-f(x-h(i)))/(2*h(i)); % centered
impcent(i) = (-f(x+2*h(i))+8*f(x+h(i))-8*f(x-h(i))+f(x-2*h(i)))/(12*h(i)); % improved centered
end

% plot of all finite difference approximations
plot(h,impfor,'b')
hold on
plot(h,impback,'k')
plot(h,cent,'r')
plot(h,impcent,'g')
xlabel('Step Size')
ylabel('Finite Difference Approximations')
title('Finite Difference Approximations vs. Step Size')
legend('Improved Forward', 'Improved Backward', 'Centered', 'Improved Centered', 'location', 'northwest')
hold off



