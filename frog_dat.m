% File for inputting all aircraft data for equations of motion
% Last Update: 21 JAN 1997
function [u0,w0,rho,Cfx,Cfo,Cfu,Cfxdot,s,b,c,m,Pe,To,Ib] =frog_dat
u0 = 88;
w0 = 0;
% Sea level- std day
rho = .0023769;
% derivative matrix due to state variables
% rows: [CD CY CL Cl Cm Cn]
% col: [u v w p q r]
Cfx = [0 0 .23 0 0 0;
0 -.31 0 0 0 .1151;
0 0 4.3034 0 3.35 0;
0 -.0509 0 -.3702 0 .1119;
0 0 -0.5565 0 -8.8818 0;
0 .0575 0 -.0537 0 -.0669];
% derivative matrix due to control inputs
% rows: [same as above]
% col: [elev rud ail]
Cfu = [.0676 0 0;
0 .0926 0;
.3914 0 0;
0 .0036 .1810;
-1.0469 0 0;
0 -.0388 -.0272];
% derivative matrix due to x-dot
Cfxdot = [0 0 0 0 0 0;
0 0 0 0 0 0;
0 0 1.3877 0 0 0;
0 0 0 0 0 0;
0 0 -3.7115 0 0 0;
0 0 0 0 0 0];
% steady state force vector
Cfo = [0614; 0; .4295; 0; 0; 0];
% physical dim.
% WT =67.73 LBS.
m = 2.1051;
s=17.5;
b= 10.58;
c=1.66;
% engine data
Pe = [17.63/12; 0;-14.92/12];
To = [9.6757 ;0;0];
% inertia tensor matrix
Ib = [ 12.52 0 0; 0 8.43 0; 0 0 18.55];