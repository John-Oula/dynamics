% File to calculate dimensional derivatives
% frogdder.m
% Last Update: 12FEB97
% Run nondimensional derivative program
ndfirog
% Calculate dynamic pressure
qbar = .5*rho*Ufps^2; % ft lbs
Malpha = CMalpha*qbar*S*cbar/Iyy; % per second^2
Mq = CMq*(cbar/(2*Ufps))*qbar*S*cbar/Iyy; % per second
Malphadot = CMalphadot*(cbar/(2*Ufps))*qbar*S*cbar/Iyy; % per second
Xu = -2*CD*qbar*S/(m*Ufps); % per second
Zu = -2*CL*qbar*S/(m*Ufps); % per second
Zalphadot = CLalphadot*(cbar/(2*Ufbs))*(qbar*S/m);
% ft per second
Zq = CLq*(cbar/(2*Ufps))*(qbar*S/m); % ft per second
Mu = 0; % per ft second
Xde = -1 *CDde*qbar*S/m; % ft per second^2
Zde = -1 *CLdelta*qbar*S/m; % ft per second^2
Mde = CMde*qbar*S*cbar/Iyy; % per second^2
Xalpha = (CL - CDalpha)*qbar*S/m; % ft per second^2
Zalpha = -1 *(CLalphaw+CD)*qbar*S/m; % ft per second^2
YB = CyB*qbar* S/m; % ft/second^2
LB = ClB*qbar*S*b/Ixx; % l/second^2
NB = CnB* qbar* S *b/Izz; % 1 /second^2
Yp = Cyp*b*qbar*S/(2*Ufps*m); % ft/sec
Yr = Cyr*b*qbar*S/(2*Ufps*m); % ft/sec
Lp = Clp*(b/(2*Ufps))*qbar*S*b/Ixx; % 1/sec
Np = Cnp*(b/(2*Ufps))*qbar*S*b/Izz; % 1/sec
Lr = Clr*(b/(2*Ufps))*qbar*S*b/Ixx;% 1/sec
Nr = Cnr*(b/(2*Ufps))*qbar*S*b/Izz; % 1/sec
Ydr = -1 *Cydr*qbar*S/m; % ft/second^2
Yda = 0; % ft/second^2
Ldr = Cldr*qbar* S *b/Ixx; % 1 /second^2
Lda = Clda*qbar*S*b/Ixx; % l/second^2
Ndr = Cndr*qbar*S*b/Izz; % l/second^2
Nda = Cnda*qbar*S*b/Izz; % l/second^2
Malphaprime = Malpha + Malphadot*(Zalpha/Ufps);
Mqprime = Mq + Malphadot;
Mdeprime = Mde + Malphadot*(Zde/Ufps);