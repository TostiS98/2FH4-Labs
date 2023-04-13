clc; % Clear the command window
clear; % Clear all variables

% Define toroid parameters
I_t = 5.0; 
N_t = 200; 
r_i = 1.5; 
r_o = 2.5; 

% Define observation plane parameters

% number of points in each dimenstion to plot
nx = 25; 
ny = 25; 
xmin = -4; 
xmax = 4; 
ymin = -4; 
ymax = 4; 
dx = (xmax-xmin)/(nx-1); 
dy = (ymax-ymin)/(ny-1); 
[X, Y] = meshgrid(xmin:dx:xmax, ymin:dy:ymax); 
Z = zeros(size(X)); 

% Compute magnetic field at each point in observation plane
Bx = zeros(size(X)); 
By = zeros(size(X)); 
Bz = zeros(size(X)); 

% for all of the points 
for i = 1:numel(X) 
    x = X(i); 
    y = Y(i); 
    r = sqrt(x^2 + y^2); 


    % compute magnetic field for points inside the toroid
    if r >= r_i && r <= r_o 
        B_phi = (I_t*N_t)/(2*pi*r); 
        Bx(i) = -B_phi * sin(atan2(y, x)); 
        By(i) = B_phi * cos(atan2(y, x)); 
    end
end

% Plot magnetic field vectors on observation plane
quiver(X, Y, Bx, By);
xlabel('x (cm)'); % Label x-axis
ylabel('y (cm)'); % Label y-axis
title('Stefan Tosti - 400367761 - MATLAB Set 16')
