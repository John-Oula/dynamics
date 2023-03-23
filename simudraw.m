function simudraw()

load simudata; % load data

% Compute Total velocity
temp = y(:,1).^2 + y(:,2).^2;

Vt = sqrt(temp); 

rows = 5;

subplot(rows,1,1); % plot figures in a column
plot(t,y(:,1));
xlabel ("Forward velocity u(t)");

subplot(rows,1,2); 
plot(t,y(:,2));
xlabel ("Vertical velocity v(t)");

subplot(rows,1,3); 
plot(t,Vt);
xlabel ("Total velocity V(t)");

subplot(rows,1,4); 
plot(t,y(:,3));
xlabel ("Pitch rate q(t)");

subplot(rows,1,5); 
plot(t,y(:,4));
xlabel ("Pitch theta(t)");