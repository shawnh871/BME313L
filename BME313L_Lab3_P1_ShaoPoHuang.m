% BME313_Lab3_P1_ShaoPoHuang
% This program will generate combined plots of rcrit vs. z and ea vs. z

Dt = 9e-6;  % set metabolite diffusivity to 9e-6 cm^2/s
V = 0.006;  % set blood plasma velocity to 0.006 cm/s
rc = 0.0005;    % set capillary radius to 0.0005
tm = 5e-5;  % set capillary wall thickness to 5e-5 cm
K = 5.75e-5;    % set metabolite mass transfer rate to 5.75e-5 cm/s
C = 6;  % set C to 6umole/cm^3
R = 0.01;   % set R to 0.01 umole/(cm^3*s)
z = 0.001:0.01:0.1; % initialize z array as values ranging from 0.001 to 0.1
y = zeros(length(z),1); % initialize y array with number of zeros equal to length of z array
fx = zeros(length(z),1); % initialize fx array with number of zeros equal to length of z array
ea = zeros(length(z),1); % initialize ea array with number of zeros equal to length of z array
iter = zeros(length(z),1); % initialize iter array with number of zeros equal to length of z array

for i= 1:length(z)  % set up for loop with index i from 1 to the length of z array
    f = @(y) (y^2)*log(y^2)-(y^2)+1-((4*Dt*C)/(R*(rc+tm)^2))+(4*Dt*((y^2)-1)*z(i))/(V*rc^2)+(2*Dt*((y^2)-1))/(rc*K);
        % primary function: f(y)
    [y(i), fx(i), ea(i), iter(i)] = bisect_SH(@(y) f(y), 1, 100, 5e-6, 50);
        % calls bisection function to determine roots of f(y)
end

rcrit = (y*(rc + tm))*(10^4); % calculates rcrit in um from roots (y values) determined by bisect function

yyaxis left     % sets up y-axis on left side
plot(z, rcrit, 'b')  % plots rcrit vs z
title('Critical Radius and Ea% vs. Z')  % title of plot
xlabel('Z (cm)') % x-axis label
ylabel('Critical Radius (um)') % y-axis (left) label

yyaxis right    % sets up y-axis on right side
plot(z, ea, '--r')  % plots ea vs z
ylabel('Approximate Percent Relative Error (Ea%)')  % y-axis (right) label
legend('Critical Radius', 'Ea%')    % plot legend
