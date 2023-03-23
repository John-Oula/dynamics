% Define the system dynamics
A = -2;
B = 1;
C = 1;
D = 0;

% Define the reference model dynamics
Am = -4;
Bm = 1;
Cm = 1;
Dm = 0;

% Define the initial state of the system
x0 = 0;

% Define the state-feedback gain
K = -1;

% Define the adaptive controller gain
K1 = 0;

% Define the adaptive law gain
Gamma = 10;
Lambda = 1;

% Define the simulation time
t = 0:0.01:10;

% Define the reference signal
r = 1*ones(size(t));

% Set the initial reference state
x_ref = 0;

% Define the tracking error and its derivative
e = zeros(1, length(t));
de = zeros(1, length(t));

% Define the state, input, and output
x = zeros(1, length(t));
u = zeros(1, length(t));
y = zeros(1, length(t));

% Set the initial state of the system
x(1) = x0;

% Simulate the system
for i = 1:length(t)-1
    % Compute the tracking error and its derivative
    e(i) = x_ref - x(i);
    de(i) = 0 - C*(x(i) - x_ref);
    
    % Compute the state-feedback control input
    u_fb = K*x(i);
    
    % Compute the adaptive control input
    u_ad = K1*r(i) + Gamma*r(i) - Lambda*de(i);
    
    % Compute the total control input
    u(i) = u_fb + u_ad;
    
    % Simulate one time step
    x_dot = A*x(i) + B*u(i);
    x(i+1) = x(i) + x_dot*0.01;
    
    % Compute the system output
    y(i) = C*x(i);
end

% Plot the results
figure
plot(t, y, t, r)
xlabel('Time (s)')
ylabel('Output')
legend('Actual', 'Reference')
title('Output Tracking')

figure
plot(t, u)
xlabel('Time (s)')
ylabel('Control Input')
title('Control Input')
