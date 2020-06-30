function [J,f] = receptor_ligand_SH(x,varargin)
% receptor_ligand_SH: determines Jacobian and function values
% [J,f] = receptor_ligand_SH(x,p1,p2...)
% x = vector of fractional occupancy values
% p1,p2... = additional parameters
% J = Jacobian matrix
% f = vector of function values

% initialize variables
Ca_0 = 5000;
Cb_0 = 10000;
Cl_0 = 24000;
Keq_1 = 7.19e-14;
Keq_2 = 6e-10;
h = 0.01;

% define first Keq equation
   function f = u(a,b)
f = (Ca_0*a + Cb_0*b)/((Ca_0*(1-a))*((Cl_0-3*Ca_0*a-2*Cb_0*b)^3))-Keq_1;
   end

% define second Keq equation
    function f = v(a,b)
f = (Ca_0*a + Cb_0*b)/((Cb_0*(1-b))*((Cl_0-3*Ca_0*a-2*Cb_0*b)^2))-Keq_2;
    end

% calculate partial derivatives using forward finite difference
% approximation
df1_x1 = (u(x(1)+h,x(2))-u(x(1),x(2)))/h;
df1_x2 = (u(x(1),x(2)+h)-u(x(1),x(2)))/h;
df2_x1 = (v(x(1)+h,x(2))-v(x(1),x(2)))/h;
df2_x2 = (v(x(1),x(2)+h)-v(x(1),x(2)))/h;

% calculate function values
f1 = u(x(1),x(2));
f2 = v(x(1),x(2));

% store partial derivatives in Jacobian matrix
J = [df1_x1 df1_x2;df2_x1 df2_x2];

% store function values in function value vector
f = [f1;f2];

end

