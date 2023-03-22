% File for Frog data which are fixed
% frog.m
% Last Update: 02 Mar 97
ac = 271; % Aileron chord in ft.#
ai =2.625; % distance from centerline to
% inner edge of aileron in ft.#
alpha01 = -2*pi/180; % a.o.a. for zero lift (radians)#
ao = 4.417; % distance from centerline to
% outer edge of aileron in ft.#
b= 10.58; % Span ofwing in ft#
bt =3.3125; % Span of horizontal tail in ft.#
bv=1.25; % Height ofvertical tail in ft.#
cbar= 1.66; % Mean aerodynamic chord (m.a.c.)
% in feet#
CLalphaafw =5.87649; % Lift curve slope ofwing
% airfoil (NACA 2415) in per
% radian#
CLalphaaft =5.72958; % Lift curve slope of horizontal
% tail airfoil (NACA 0010-34) in per
% radian#
CLalphaafv = 2*pi; % Lift curve slope ofvertical
% tail airfoil (flat plate) in per
% radian#
CMac = -.045; % Coefficient ofmoment about
% aero. ctr.#
ct =0.968; % m. a. chord of horizontal tail in ft

c4tail =5.9086; %5.8306, % Location of quarter chord of
% horizontal tail in feet from
% proptip
c4wing =1.3108; %1.2483, % Location of quarter chord of
% wing in feet from proptip
daOdde =.625; % Section flap effectiveness
% for 33% flap (elevator)
% Abbott and Doenhoff p. 190
daOddr=675; % Section flap effectiveness
% for 38% flap (rudder)
% Abbott and Doenhoff p. 190
deda =.4; % Downwash angle derivative
% estimated from Perkins/Hage
Df= 1.0416; % Depth offuselage in ft.
eO = 0; % Assumed epsilon naught
ee = .8; % Assumed span efficiency factor
g = 32.174; % gravitational constant
hac=.241; % Location in percent chord of
% aero. ctr. (NACA2415)
it = (4.5+2)*pi/180; % Incidence angle of hor. tail
lewing = 8958; % Location ofleading edge ofwing
% in feet from proptip
letail =5.667; % Location ofleading edge of
% horizontal tail in feet from
% proptip
mg =19.5/12; % Location ofmain gear in ft
% from proptip
ng=-5/12; % Location of nose gear in ft


% from proptip
S = 17.5; % Reference (wing) area in sq. ft
Sr=.501736; % Rudder area in sq. ft.
St =3.17448; % Horizontal tail area in sq. ft.#
Sv =0.98177; % Vertical tail area in sq. ft.#
Wf = .75; % Width offuselage in ft.#
ybar = b/4; % Spanwise location ofm.a.c.#
zv = .416; % Vert, tail height to m.a.c.
% (estimated)
Zwf=.5833; % Vertical height ofwing
% above fuselage C.L. in ft.