% BME313L_Lab1_Part1_ShaoPoHuang
% This program will 1) generate a vector of temperatures,
% 2)convert the vector to Celsius, 3) compute a vector of densities,
% 4) create a plot of density vs. temperature

Tf = 32:3.6:93.2;   % creates an array of temperature values from 32°F to 93.2°F in intervals of 3.6°F
Tc = (5/9)*(Tf-32);  % converts temperature values to Celsius
p = 5.5289e-8*Tc.^3-8.5016e-6*Tc.^2+6.5622e-5*Tc+0.99987;  % calculates density using Celsius temperature values

plot(Tc,p)  % plots density vs. temperature in Celsius
title('Density vs Temperature for Freshwater Density')  % title of the plot
xlabel('Temperature (°C)')  % x-axis label
ylabel('Density (g/cm^3)')  % y-axis label

    
