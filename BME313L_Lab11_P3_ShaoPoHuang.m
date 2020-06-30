% BME313L_Lab11_P3_ShaoPoHuang
% This program will plot the deflection, slope, moment, shear, and
% distributed load versus position on a beam in subplots

clear; clc; close all % clear variables and console; close all figures

E = 200e9; % Young's modulus (Pa)
I = 3e-4; % moment of inertia (m^4)
h = 0.375; % step size

x = [0 0.375 0.75 1.125 1.5 1.875 2.25 2.625 3]; % position along beam (m)
y = [0 -0.2571 -0.9484 -1.9689 -3.2262 -4.6414 -6.1503 -7.7051 -9.275]/100; % deflection (m)

% call Derive_SH function to perform derivative approximation
d1 = Derive_SH(y,h); % slope (m/m)
d2 = Derive_SH(d1,h)*E*I; % moment (N*m)
d3 = Derive_SH(d2,h); % shear (N)
d4 = Derive_SH(d3,h)*(-1); % distributed load (N/m)

% plot deflection, slope, moment, shear, and distributed load in subplots
subplot(3,2,1)
plot(x,y,'-o')
xlabel('Position on Beam (m)')
ylabel('Deflection (m)')
title('Deflection vs. Position')
subplot(3,2,2)
plot(x,d1)
xlabel('Position on Beam (m)')
ylabel('Slope (m/m)')
title('Slope vs. Position')
subplot(3,2,3)
plot(x,d2)
xlabel('Position on Beam (m)')
ylabel('Moment (N*m)')
title('Moment vs. Position')
subplot(3,2,4)
plot(x,d3)
xlabel('Position on Beam (m)')
ylabel('Shear (N)')
title('Shear vs. Position')
subplot(3,2,5)
plot(x,d4)
xlabel('Position on Beam (m)')
ylabel('Distributed Load (N/m)')
title('Distributed Load vs. Position')

