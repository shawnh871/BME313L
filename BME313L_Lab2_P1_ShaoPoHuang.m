% BME313L_Lab2_P1_ShaoPoHuang
% This program will 1) generate three subplots relating vertical position
% to shear stress and velocity and 2) create a movie relating vertical 
% position to velocity over time

clc, clf, clear % clears command window, all figures and items saved from previous runs

h = 2; % initializes 'h' as a scalar equal to 2
U = 6; % initializes 'U' as a scalar equal to 6
d = -2; % initializes 'd' as a scalar equal to -2
u = 0.3; % initializes 'u' as a scalar equal to 0.3
y = 0:0.1:h; % initializes 'y' as an array containing values from 0 to h in increments of 0.1
v = 0.3; % initializes 'v' as a scalar equal to 0.3

vel = @(U, d) (-1/(2*u))*d*(h-y).*y+(U/h)*y; 
    % creates a function handle for velocity with two inputs: U and d
ss = @(U, d) -(h/2-y)*d+u*U/h;
    % creates a function handle for shear stress with two inputs: U and d

v1 = vel(6, 0); % calculates velocity values using vel function with U = 6, d = 0
s1 = abs(ss(6, 0)); % calculates shear stress values using ss function with U = 6, d = 0
subplot(2,2,1) % designation as first subplot in 2x2 (row x column) grid format
plot(v1,y) % plots y vs v1
hold on % retains existing graph
plot(s1,y) % plots y vs s1 on the same graph
title({'Vertical Position vs. Velocity';'and Shear Stress for U=6, d=0'}) % title of plot
ax = gca; % change font size
ax.FontSize = 8; % reduce font size to 8.8
xlabel('Velocity and Shear Stress') % x-axis label
ylabel('Vertical Position') % y-axis label
legend('Velocity', 'Shear Stress') % plot legend
hold off % terminates graphing process for existing plot

v2 = vel(0, -2); % calculates velocity values using vel function with U = 0, d = -2
s2 = abs(ss(0, -2)); % calculates shear stress values using ss function with U = 0, d = -2
subplot(2,2,2) % designation as second subplot in 2x2 (row x column) grid format
plot(v2,y) % plots y vs v2
hold on % retains existing graph
plot(s2,y) % plots y vs s2
title({'Vertical Position vs. Velocity';'and Shear Stress for U=0, d=-2'}) % title of plot
ax = gca; % change font size
ax.FontSize = 8; % reduce font size to 8.8
xlabel('Velocity and Shear Stress') % x-axis label
ylabel('Vertical Position') % y-axis label
legend('Velocity', 'Shear Stress') % plot legend
hold off % terminates graphing process for existing plot

v3 = vel(6, -2); % calculates velocity values using vel function with U = 6, d = -2
s3 = abs(ss(6, -2)); % calculates shear stress values using ss function with U = 6, d = -2
subplot(2,2,3) % designation as third subplot in 2x2 (row x column) grid format
plot(v3,y) % plots y vs v3
hold on % retains existing graph
plot(s3,y) % plots y vs s3
title({'Vertical Position vs. Velocity';'and Shear Stress for U=6, d=-2'}) % title of plot
ax = gca; % change font size
ax.FontSize = 8; % reduce font size to 8.8
xlabel('Velocity and Shear Stress') % x-axis label
ylabel('Vertical Position') % y-axis label
legend('Velocity', 'Shear Stress') % plot legend
hold off % terminates graphing process for existing plot

t = zeros(100,1); % initializes t array with 100 zeros
t(1) = 0.0001; % sets first value in t array to 0.0001
clear M % clears items stored in 'M'
V = 0; % sets initial velocity equal to 0
subplot(2,2,4) % designation as fourth subplot in 2x2 (row x column) grid format
plot(V,y) % plots y vs V
axis([0 6 0 2]) % sets x-axis from 0 to 6 and y-axis from 0 to 2
M(1) = getframe; % stores first movie frame

for i = 2:100 % for loop with index for running 99 subsequent values for t
    t(i) = t(i-1)*1.2; % equation for calculating subsequent t values
    s = 0; % initializes running sum to zero
    for n = 1:100 % index for running summation of n from 1 to 100
        s = s + (1/n)*exp((-n^2)*(pi^2)*v*(t(i-1))/h^2)*sin(n*pi*(1-y/h)); % running sum of summation
    end % ends for loop
    V = U*y/h - (2*U/pi)*s; % equation for calculating velocity
    subplot(2,2,4) % designation as fourth subplot in 2x2 (row x column) grid format
    plot(V,y) % plots y vs V
    axis([0 6 0 2]) % sets x-axis from 0 to 6 and y-axis from 0 to 2
    title({'Vertical Position vs. Velocity';'for Couette Solution'}) % title of plot
    ax = gca; % change font size
    ax.FontSize = 8; % reduce font size to 8.8
    xlabel('Velocity') % x-axis label
    ylabel('Vertical Position') % y-axis label
    M(i) = getframe; % stores movie frames in M array
end % ends for loop

movie(M,1) % plays movie 
