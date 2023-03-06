
% clear all 
clc; 
clear; 

% I will consider the line charge a single point charge of 4uC for the
% sake of a numerical solution
Q=4;

% Define the location of the point charge that we're considering and the
% unit vector in the z diretion 
C=[0 0 1];
az=[0 0 1];

% define the lower and upper bounds of the surface
% we will consider y to be a very large number to simulate infinity 
x_lower = 0;
x_upper = 1;
y_lower = -100;
y_upper = 100;

% define the number of x steps and y steps, as well as the differential
% units 
Number_of_x_Steps=400;
Number_of_y_Steps=400;
dx=(x_upper-x_lower)/Number_of_x_Steps;
dy=(y_upper-y_lower)/Number_of_y_Steps;

% Initialize the flux to 0
flux=0;

% preform the iterative summation 
for j=1:Number_of_y_Steps
    for i=1:Number_of_x_Steps
        % area of the infintesimal element 
        ds=dx*dy;

        % go to the centre of the area element
        x=x_lower+0.5*dx+(i-1)*dx;
        y=y_lower+0.5*dy+(j-1)*dy;
        
        % P is the center of the grid, and R is the vector pointing from
        % the point charge to the centre of the grid
        P=[x y 0];
        R=P-C;

        % determine the contribution of the flux
        RMag=norm(R);
        R_Hat=R/RMag;
        R_surface=-az;
        flux=flux+Q*ds*dot(R_surface,R_Hat)/(4*pi*RMag^2);
    end
end

%output the final flux 
flux


