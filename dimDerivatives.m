% File to calculate dimensional derivatives

clc
close all
clear

% Load Non-Dimensional Stability derivatives

load('nonDimDerivatives.mat');
load('dynamics.mat');

SIunits = false;

if SIunits
    % Conversion factors
    ft_to_metre = 0.3048;
    lb_to_kg = 0.453592;
    slug_to_kg = 14.5939;


    MOIconvert = slug_to_kg * (ft_to_metre ^ 2);



    % Constants
    a = 340; % sonic velocity in m/s
    g = 9.80665; % acceleration due to gravity
    rho = 1.225; % density in kg/m^3
    
    % Convert
    U_0 = U_0 * ft_to_metre;
    S = S * ft_to_metre^2;
    b = b * ft_to_metre;
    c = c * ft_to_metre;
    m = m * lb_to_kg;

    Ixx = Ixx * MOIconvert;
    Iyy = Iyy * MOIconvert;
    Izz = Izz * MOIconvert;
    Ixz = Ixz * MOIconvert ;  


else
    a = 1125.33; % sonic velocity in ft/s
    g = 32.174;

    % Convert mass moments of inertia to consistent units --> INTO lb-ft^2 FROM slug-ft^2
    Ixx = Ixx * g;
    Iyy = Iyy * g;
    Izz = Izz * g;
    Ixz = Ixz * g;
end

q = 0.5 * rho * U_0^2;
M = U_0 / a;


% calculate Propulsion matrix
Prop = [ eye(3);
0,-Pe(3),Pe(2);
Pe(3),0,-Pe(1);
-Pe(2),Pe(1),0];

Cx_a = C_L - C_D_a;

Xu = -2 * C_D * q * S /(m * U_0) ;
Xw =  q * S / (m * U_0 )* Cx_a ;
Xq = 0;

Zu =  -2 * C_L * (q * S / (m * U_0)); % (2 * C_L + M * C_L_M).... -0.2095
Zw = -q * S / m / U_0 * (C_D + C_La);
Zdw = q * S * c / (m * 2 * U_0^2 ) * C_L_da;
Zq =  -q * S * c  / (m * 2 * U_0 ) * C_L_hq;

Mu = C_m_M * (q * S * c / (Iyy * U_0)); % C_m_u .. 0.0003
Mw = C_m_a * q * S * c / ( Iyy * U_0 ) ;
Mdw = q * S * c^2 / ( Iyy * U_0^2  ) * C_m_da; % ...-0.0008 
Mq = q * S * c^2 / ( Iyy * U_0 * 2) * C_m_hq;

Zde = -(C_L_de * q * S )/ m; % -2.9793
Mde = q * S * c / Iyy * C_m_de;


Mustar = Mu + Mdw * Zu; %
Mwstar = Mw + Mdw * Zw;
Mqstar = Mq + Mdw * Zq;
Mthetastar = -Mdw * g * sin(theta_0);
Mdestar = Mde + Mdw * Zde;

% System stability matrix

A = [Xu Xw 0  -g*cos(theta_0);  Zu Zw U_0 + Zq  -g * sin(theta_0);
    Mustar Mwstar Mqstar Mthetastar;  0  0 1  0];

B = [0; deg2rad(Zde); deg2rad(Mdestar); 0];  % Control matrix

C = eye(size(A, 1));

D = zeros(size(B));

longSys = ss(A, B, C, D); % State-space system

T = linspace(0,200,10000);

% Verify contrallability of all states

co = ctrb(A,B);
cntrl = rank(co);
assert(cntrl == 4);

% Check open-loop eigenvalues
Apole = eig(A);


% Compute the eiginevalues of the UAV
pol = eig(longSys);


% Step response of the UAV
figure(1)
step(longSys,T); % u w q theta
hold on;

% Desired closed-loop eigenvalues
pl = [ -1.8 + 1.5i;
  -1.8 - 1.5i;
   -0.02 + 0.2i;
   -0.02 - 0.2i];

% Compute gain matrix K using pole placement
K = place(A,B,pl);

% Check for closed-loop eigenvalues 
Acl = A-B*K; % Closed-loop A matrix 
Ecl = eig(Acl);

% Create closed-loop system
syscl = ss(Acl,B,C,D);

figure(1);

% Check step response
step(syscl);

Kdc = dcgain(syscl);
Kr = 1/Kdc;

% Create scaled input closed loop system
sys_scaled = ss(Acl, B*16,C,D);
step(sys_scaled);
info = stepinfo(sys_scaled);

%info.Overshoot
%info.RiseTime

save('sysMatrix.mat');





