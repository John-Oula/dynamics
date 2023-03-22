

clc
close all
clear

% Flight Conditions
theta_0 = 0;    
m = 564000;      % in lb
h = 80000;        % Altitude
rho = 0.002377; % slugs/cubic feet
rho = 0.0765; % lb/ft^3
U_0 = 165; % Knots
U_0 = U_0 * 1.68781; % to feet/second

% Constants

a = 340; %  velocity in m/s
g = 9.80665; % acceleration due to gravity


% Moments of Inertia about x,y,z axis respectively

Iyy = 32.3e6; % slug-ft^2
Ixx = 14.3e6;
Izz = 45.3e6;
Ixz = -2.23e6;

% UAV geometry data

S = 5500; % square feet
b = 195.68; % feet
c = 27.31; % feet

% engine data
Pe = [17.63/12; 0;-14.92/12];
To = [9.6757 ;0;0];

save("dynamics.mat")