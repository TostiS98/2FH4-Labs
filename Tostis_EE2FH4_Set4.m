% Matlab set 4 - Stefan Tosti - 400367761\
clc;
clear;

% Define some constants for our program
Epsilono = 8.854e-12;
D = 2e-6;
P = [0 0 1];
E = [0 0 0];

% Initialize the discretization in rho and phi 
rho_steps = 2000;
phi_steps = 2000;

% Initialize our upper and lower bounds for rho and phi 
rho_bottom = 0;
rho_top = 1;
phi_bottom = 0;
phi_top = 2*pi;

% Set the number of steps in the rho and phi dimensions 
d_rho = (rho_top - rho_bottom)/rho_steps;
d_phi = (phi_top - phi_bottom)/phi_steps;

% Initialize the area of a single differential unit as well as the charge
% on a single differential element
ds = d_rho * d_phi;
dQ = D * ds;

% preform the iterative summation
for j=1:rho_steps
    for i=1:phi_steps
        rho= rho_bottom +d_rho/2+(i-1)*d_rho;     
        phi= phi_bottom +d_phi/2+(j-1)*d_phi;
        R = P-[rho*cos(phi) rho*sin(phi) 0];
        RMag=norm(R);
        E=E+(rho*dQ/(4*Epsilono*pi* RMag ^3))*R;
    end
end

% display the final vector 
disp(E);






