% clear
clc;
clear;

% define our constants 
V = 0;
S1 = 0;
S2 = 0;
S3 = 0;
S4 = 0;
S5 = 0;

% initalize our counter variables for summation 
r_steps = 1000;
phi_steps = 1000;
theta_steps = 1000;

% initialize our unit differentials 
d_r = (2 - 0) / r_steps;
d_phi = (pi/2 - pi/4) / phi_steps;
d_theta = (pi/2 - pi/4) / phi_steps;

% initialize variables to lower bounds
r = 0;
phi = pi/4;
theta = pi/4;

% calculate the volume of the surface dtheta, dphi, dr
for k=1:r_steps
    for j=1:theta_steps
        for i=1:phi_steps
            V = V + (r^2)*(sin(theta))*d_r*d_phi*d_theta;
        end
        % increase theta everytime phi has been traversed 
        theta = theta + d_theta;
    end
    % reset theta to lower bound
    % increment r each time theta and phi have been travelled 
    theta = pi/4;
    r = r + d_r;
end
% reset r to its lower bound 
r = 0;

V

% define the upper bound of r
r_upper = 2; 

% calculate the surface area of S1 and S2
for k=1:r_steps
    for j=1:theta_steps
        S1 = S1 + (r * d_theta * d_r);
    end
    % increment r with every traversal 
    r = r + d_r;
end

% reset r to the minimum value and assign S2 to the same value as S1
r = 0;
S2 = S1;

% determine the surface area of S3
r_upper = 2;
for k=1:theta_steps
    for j=1:phi_steps
        S3 = S3 + (((r_upper)^2)*sin(theta)*d_theta*d_phi);
    end
    theta = theta + d_theta;
end
theta = pi/4;
S3;

% calculate S4 and S5 (we can do them in one since they are the same
% calculation, all we need to change is the value of theta that we use 
theta_lower = pi/4;
theta_upper = pi/2;

for k=1:r_steps
    for j=1:phi_steps
        S4 = S4 + (sin(theta_upper) * d_r * d_phi);
        S5 = S5 + (sin(theta_lower) * d_r * d_phi);
    end
    r = r + d_r;
end

S = S1 + S2 + S3 + S4 + S5














