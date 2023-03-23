function simu()
y0=[0 0 0 0 -2]; % initial condition u w q theta
[t,y]=ode45("simuequ",[0 200],y0); % ode function
% y: an array of solutions to a set of differential equations
% each row of y corresponds to a time instant returned in vector t
% y=[state x (u w q theta), reference output y_m

save simudata t y; %