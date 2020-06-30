% BME313L_Lab11_P1_ShaoPoHuang
% This program will plot position, speed, and acceleration vs. time based
% on the given data. It will also display the speed and acceleration at
% time = 5s, 10s, and 15s.

clear; clc; close all % clear variables and console; close all figures

data = dlmread('positionData.txt'); %data must be in folder with .m files
time = data(:,1);     %time (seconds)
position = data(:,2); %position (meters)

time_s = 0.05:0.1:22.45; % time vector for first derivative
time_a = 0.1:0.1:22.4; % time vector for second derivative

speed = diff(position)./diff(time); % calculate first derivative
acceleration = diff(speed)./diff(time_s); % calculate second derivative

% find indices for time = 4.95s and 5.05s
i1 = find(time_s <=5.06 & time_s>=5.04);
i2 = i1 - 1;

% find speed at time = 5s
speed1 = (speed(i1)+speed(i2))/2;

% display result
fprintf('The speed at time = 5s is %.4f m/s.\n', speed1)

% find indices for time = 9.95s and 10.05s
j1 = find(time_s <=10.06 & time_s>= 10.04);
j2 = j1 - 1;

% find speed at time = 10s
speed2 = (speed(j1)+speed(j2))/2;

% display results
fprintf('The speed at time = 10s is %.4f m/s.\n', speed2)

% find indices for time = 14.95s and 15.05s
k1 = find(time_s <=15.06 & time_s>= 15.04);
k2 = k1 - 1;

% find speed at time = 15s
speed3 = (speed(k1)+speed(k2))/2;

% display results
fprintf('The speed at time = 15s is %.4f m/s.\n', speed3)

% find acceleration at time = 5s
m = find(time_a <=5.01 & time_a>= 4.99);
fprintf('The acceleration at time = 5s is %.4f m/s^2.\n', acceleration(m))

% find acceleration at time = 10s
n = find(time_a <=10.01 & time_a>= 9.99);
fprintf('The acceleration at time = 10s is %.4f m/s^2.\n', acceleration(n))

% find acceleration at time = 15s
p = find(time_a <=15.01 & time_a>= 14.99);
fprintf('The acceleration at time = 15s is %.4f m/s^2.\n', acceleration(p))

% plot position, speed, and acceleration vs. time on three separate plots
figure(1)
plot(time, position)
xlabel('Time (s)')
ylabel('Position (m)')
title('Position vs. Time')
figure(2)
plot(time_s, speed)
xlabel('Time (s)')
ylabel('Speed (m/s)')
title('Speed vs. Time')
figure(3)
plot(time_a, acceleration)
xlabel('Time (s)')
ylabel('Acceleration (m/s^2)')
title('Acceleration vs. Time')
