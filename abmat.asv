% File for modelling the nonlinear equations of motion
% Last Update: 21 JAN 1997
function accel = abmat(x);
% calculates the accelerations (angular and linear) due to
% aero forces; w X v; gravity.
% Variables brought from workspace:
% x = combination vector [contrl inputs, state variables, euler angles]
% (da, de, dr, dtrt, u, v, w, p, q, r, phi, theta, psi)
% Variables called from function "frog_data"
% rho = air density
% b = wing span
% c = wing cord
% s = wing area
% Cfo = Steady state force term
% Cfu = Stability derivative for control inputs
% m = airplane mass
% lb = inertia tensor matrix (body frame)
% To = Thrust scale term
% Pe = Engine position matrix
% get the aircraft data
[u0,w0,rho,Cfx,Cfo,Cfu,Cfxdot,s,b,c,m,Pe,To,Ib] = frog_dat;
% seperate the combined vector into seperate elements
u = [x(1);x(2);x(3)];
dtrt = x(4);
state = [x(5); x(6); x(7); x(8); x(9); x(10)];
lambda = [x(l1); x(12); x(13)];
%%%%%% calculate velocity wrt the airmass and form state vector
%%%%%% that will be used to calculate the aerodynamic forces/moments
state1 = [state(l)-u0, state(2), state(3)-w0; x(8); x(9); x(10)];
%%%%%% calculate total velocity, vt
vt = (state(l)^2 + state(2)^2 + state(3)^2)^.5;
% calculate qbar
qbar=.5*rho*(vt^2);
% calculate Ml
M1 = diag([l/vt, 1/vt, 1/vt, (.5*b)/vt, (.5*c)/vt, (.5*b)/vt]);
% calculate M2
M2 = diag([0, 0, (.5*c)/(vt^2), 0, 0, 0]);
% calculate Sprime
Sprime = diag([-l, 1, -1, b, c, b]*s);
% calculate Mu
Mu = inv([eye(3)*m,zeros(3),zeros(3),Ib]);
% calculate Tw2b
alpha = state(3)/vt;
beta = state(2)/vt;
T1 = [cos(alpha), 0, sin(alpha); 0,1,0; -sin(alpha), 0, cos(alpha)];
T2 = [cos(beta), -sin(beta), 0; sin(beta), cos(beta), 0; 0,0,1];
Tw2b = [T1'*T2', zeros(3); zeros(3), T1'*T2'];
% calculate Chi
Chi = eye(6) -Mu*Tw2b*qbar*Sprime*Cfedot*M2;
% calculate Propulsion matrix
Prop = [ eye(3);
0,-Pe(3),Pe(2);
Pe(3),0,-Pe(l);
-Pe(2),Pe(l),0];

% calculate gravity vector and rotation matrix
Rot = [1, 0, -sin(lambda(2));
0, cos(lambda(l)), cos(lambda(2))*sin(lambda(l));
0, -sin(lambda(l)), cos(lambda(2))*cos(lambda(l))];
Ru2b = [Rot,zeros(3)];
g = [0;0;32.174];
FgU = m*g;
% put the components due to gravity; thrust; and control surface deflections
% together for their contribution to x-dot
thrust = Prop*To*dtrt;
gravity = Ru2b*FgU;
ctrl=qbar*(Tw2b*(Sprime*(Cfo + (Cfu*u))));
xdotu=(Mu*(ctrl+thrust+gravity));
% calculate rotation matrix
omegax = [0,-state(6),state(5);state(6),0,state(4);-state(5),state(4),0];
wxlb = (-inv(Ib))*(omegax*Ib);
Rot = [-omegax, zeros(3); zeros(3), wxlb];
% rotation component ofxdot(wXv)
xdotrot = Rot*state;
% state vector feedback component xdot
xdotcfx =qbar*(Mu*(Tw2b*(Sprime*(Cfx*(Ml *statel))))),
% add three components ofxdot together and premult by inv(Chi)
xdot= inv(Chi) * (xdotrot+xdotcfx+xdotu);
% calc accel that a strap-down IMU would measure
xdotb=xdot-xdotrot-Ru2b* g;
% put together for the return vector
%accel=[xdotb( 1 );xdotb(2);xdotb(3);xdot];
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%o/0%%%%
%%%%%%
% return xdot only
accel=xdot;
