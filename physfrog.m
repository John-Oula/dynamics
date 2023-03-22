% File to calculate physical considerations
% physfrog.m
% Last Update: 04FEB97
% Load frog data
frog
% Load flight condition data
fcfrog
% Calculate aircraft weight
W = Wlmg + Wrmg + Wng;
% Calculate aircraft mass
m = W/g;
% Calculate aspect ratio ofwing
AR = b^2/S;
% Calculate aspect ratio of hor. tail
ARt = bt^2/St;
% Calculate aspect ratio ofvert, tail
ARv = bv^2/Sv;
% Calculate longitudinal center of gravity
h = ((ng*Wng + mg*(Wlmg+Wrmg))/W-lewing)/cbar;

% Calculate "tail length" from e.g. to horizontal tail a.c.
% same for horizontal and vertical
It = c4tail - (lewing + h*cbar);
lv = It;
% Calculate "tail length" from c/4 wing to c/4 tail
ltprime = c4tail - c4wing;
% Calculate hor. tail volume coefficient
VH = lt*St/(S*cbar);
% Calculate vert, tail volume coefficient (yaw)
W = lv*Sv/(b*S);
% Calculate vert, tail volume coefficient (roll)
Vprime = zv*Sv/(b*S);
% Unit antisymmetrical angle of attack for outer and inner
% edge of aileron (See Smetana p. 141)
antisymo = ao/(b/2);% 0.83497
Cldatauo = .625;
antisymi = ai/(b/2);% 0.49622
Cldataui = .248;
cacw = ac/cbar;%0.16325
tau = .48;
% for yawing moment due to aileron, see p. 142, Smetana
eta = ai/(b/2);%0.49622 AR=6.3963
K = -.175;
% for side force due to rudder deflection, see Smetana p. 145
vratio = Sr/Sv;% 0.511052
taur=.675;
% for rolling moment due to sideslip, See Raymer, Fig. 16.21, p. 439
ClBwCL = -.04;