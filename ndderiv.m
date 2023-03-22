% File to calculate nondimensional derivatives
% ndderiv.m
% Last Update: 12FEB97
% Load Frog data with flight condition
phfrog
% Calculate coefficients oflift and drag
CL = W/(.5*rho*Ufps^2*S);
CD = CL/LD;
D=CD*(.5*rho*Ufps^2*S);
% Calculate lift curve slope ofwing in per radian
CLalphaw = CLalphaafw/(l+CLalphaafw/(pi*ee*AR)),
% Calculate lift curve slope of horizontal tail in per radian
CLalphat = CLalphaaft/(l+CLalphaaft/(pi*ee*ARt));
% Calculate lift curve slope ofvertical tail in per radian
CLalphav = CLalphaafv/(l+CLalphaafv/(pi*ee*ARv));
% Calculate change in hor. tail lift with change in elevator
dcLtdde = daOdde * CLalphat; % per radian
% Calculate change in vert, tail lift with change in rudder
dcLvddr = daOddr * CLalphav; % per radians

% Calculate zero lift pitching moment
CMO = CMac + VH * CLalphat * (it + eO);
% Calculate CMalpha in per radian
CMalpha = CLalphaw*((h-hac)-VH*(CLalphat/CLalphaw)*(l-deda));
% Calculate change in aircraft lift with change in elevator
CLdelta = dcLtdde*(St/S); % per radian
% Calculate change in aircraft pitching moment w. chng in elevator
CMde = -1 *VH*dcLtdde; % per radian
% Calculate angle of attack and elevator angle for trimmed flight
%
% CM = CMO + CMalpha*alpha + CMde*de
% Cl = CLalphaw*alpha + CLdelta*de
%
%
% |CLalphaw CLdelta | | alpha | | CL |
% I 111 = 11
% |_CMalpha CMde | |_de_| |_-CM0_
%
% A * X = C
%
A=[CLalphaw CLdelta
CMalpha CMde ];
C = [ CL
-1*CM0];

X = inv(A)*C;
atrim = X(l,l); % trim a.o.a. in radians
etrim = X(2,1); % trim elevator in radians
% Calculate change in yawing moment with change in rudder
% "rudder power"
% assumes W/Vinfinity = 1
Cndr = -1 *W*dcLvddr; % in per radian
% Calculate CnB contribution from vert, tail
% CnB - CLalphav*W*(W/Vinfinity)A
2*(l-dsigma/dbeta);
% assumes W/Vinfinity = 1 and dsigma/dbeta = 0
CnB = CLalphav*W;% in per radian
% Calculate change in rolling moment with change in sideslip
% First calculate dihedral contribution from wing
% Raymer p. 439
ClBwf= -1.2*sqrt(AR)*Zwf*(Df+Wf)/b^2;
ClBw = ClBwCL*CL+ClBwf;
% Next calculate contribution from fin
% ClBv = -l*Clalphav*Vprime*(W/Vinfimty)^2*(l-dsigma/dbeta)
% Assume W/Vinfinity = 1 and dsigma/dbeta = 0
ClBv = -1 *CLalphav*Vprime; % in per rad
% Combine ClBg and ClBv into C1B
C1B = ClBw + ClBv; % in per rad
% Calculate "aileron power", Clda
% See Smetana pp. 139-141
Cldatau = Cldatauo - Cldataui;
Clda = Cldatau*tau; % in per radian
% Calculate change in yawing moment w. aileron deflection
Cnda = 2*K*CL*Clda; % in per radian
% Calculate side force due to yaw
% By Smetana p. 107
CyB = -.31; % in per radian
% Calculate side force due to rudder
Cydr = CLalphav*taur*Sv/S; % in per radian
% Calculate side force due to aileron
% By Smetana, p. 138
Cyda = 0;
% Calculate rolling moment due to rudder
Cldr = Cydr*zv/b; % in per radian
% Calculate change in drag due to change in elevator
% Smetana pp. 95-100
% Using Figure 25 at 6 degrees aoa
CDde = ((.16-.03)/(20*pi/180))*St/S; % in per radians
% Calculate change in drag with change in aoa
% Smetanapp. 64-65
% Assuming dCDO/dalpha is negligible
CDalpha = 2*CL*CLalphaw/(pi*ee*AR); % in per radian
% Calculate change in pitching moment w.r.t. alphadot
% Smetana pp. 78-81, etat assumed = 1
CMalphadot = -2*CLalphat*deda*(ltprime/cbar)*(lt/cbar)*(St/S); % in per radian
% Calculate change in lift with pitch rate
% Smetana pp. 82-85
% Neglecting wing contribution, assuming etat = 1
CLq = 2*(lt/cbar)*CLalphat*(St/S); % in per radian
% Calculate change in lift with alphadot
% Smetana pp. 75-76
CLalphadot = -1 *CMalphadot/(lt/cbar); % in per radian
% Calculate change in pitching moment w. pitch rate
% Smetana pp. 87-88
% Assuming etat = 1
CMq = -2*(cbar/4-h*cbar)*abs(cbar/4-h*cbar)*CLalphaw/(cbar^2)-2*(lt/cbar)^...
    2*CLalphat*(St/S); % in per radian
% Calculate roll damping
% Smetana pp. 122-125 % Clp(a0:2pi)=-0.475
% Neglecting contribution from vertical tail
Clp = -.475*(AR+4)/(2*pi*AR/CLalphaw+4); % in per radian
% Calculate change in yawing moment due to rolling
% Smetanapp. 126-129
% Neglecting contribution from vertical tail
Cnp = -1 *CL/8; % in per radian
% Calculate change in side force with yaw rate
% From Schmidt p. 3-23
% Assume etat = 1
Cyr = 2*W*CLalphav; % in per radian
% Calculate change in rolling moment w. yaw rate
% Schmidt p. 3-24
% Tail contribution
Clrv = (zv/b)*Cyr; % in per radian
% Wing contribution
Clrw = CL/4; % in per radian
% Total
Clr = Clrv + Clrw; % in per radian
% Calculate yaw damping
% Schmidt p. 3-25
% Tail contribution
Cnrv = -1 *(lv/b)*Cyr; % in per radian
% Wing contribution from Smetana p. 136
CDO = CD-CL^2/(pi*ee*AR);
Cnrw = -.02*CL^2-.3 *CD0; % in per radians
% Total
Cnr = Cnrv + Cnrw; % in per radian
% The following 3 derivatives are negligible and taken to be 0
CDq = 0; % in per radian
Cyq = 0; % in per radian
Cyp = 0; % in per radian
% A few misc. calculations
% Static Margin/Neutral Point
statmar = CMalpha/(-l*CLalphaw);
hn = statmar + h;
