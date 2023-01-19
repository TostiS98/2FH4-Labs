
% clear all variables and command line
clc;
clear;

% define all points as well as the origin 
R1 = [1 2 3];
R2 = [3 2 1];
O = [0 0 0];

% compute vectors
R1_O = R1 - O;
R2_O = R2 - O;

% compute dot product 
R1_DOT_R2 = dot(R1_O, R2_O)

% compute the dot of R2 with itself
R2_DOT_R2 = dot(R2, R2);

% compute the projection 
PROJ = (R1_DOT_R2 / R2_DOT_R2)*(R2_O)

% compute the magnitude of R1 and R2
MAG_R1 = norm(R1);
MAG_R2 = norm(R2);

% compute the cos of the angle theta
COS_THETA = (R1_DOT_R2)/(MAG_R1 * MAG_R2);

% compute the angle itself
THETA = acos(COS_THETA)





