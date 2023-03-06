
% clear all 
clc; 
clear; 

% define constants
Epsilono=8.85e-12; 
D=2.0e-6;

% initialize discrete steps in each dimension
Number_of_r_Steps=100;   
Number_of_theta_Steps=100;       
Number_of_phi_Steps=100;

% setup boundaries 
r_lower=2;
r_upper=3;
theta_lower=0;
theta_upper=pi;
phi_lower=0;
phi_upper=2*pi;

% set up differential elements 
dr=(r_upper-r_lower)/Number_of_r_Steps;  
dtheta=(theta_upper-theta_lower)/Number_of_theta_Steps;
dphi=(phi_upper-phi_lower)/Number_of_phi_Steps;


WE = 0;

% iterate through all discrete elements 
for j=1:Number_of_theta_Steps
    for k=1:Number_of_r_Steps
        for i=1:Number_of_phi_Steps

            % move to the centre of the grid piece 
            r= r_lower +dr/2+(i-1)*dr;   
            theta= theta_lower +dtheta/2+(i-1)*dtheta;
            phi= phi_lower +dphi/2+(j-1)*dphi;

            % determine the energy from each discrete point 
            E=(D/(Epsilono*r*r)); 
            dV=r*r*sin(theta)*dtheta*dphi*dr;
            dWE=0.5*Epsilono*E*E*dV;
            WE=WE+dWE;
        end
    end
end
WE %display the total energy 