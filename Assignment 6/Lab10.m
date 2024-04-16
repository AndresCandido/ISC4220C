% Lab 10 ODE
% Q3
tic
g = 0.1 ;
opts = odeset('RelTol',1.0e-4);

tspan = [0 2/g];
y0 = 0.1;
%[t,r] = ode45(@(t,r) r^2 - r^3 , tspan, y0, opts);

[t,r] = ode23s(@(t,r) r^2 - r^3 , tspan, y0, opts);

plot(t,r,'-o')
toc
% Q4

opts = odeset('RelTol',1.0e-4);

tspan = [0 1];
y0 = 0;

[t,y] = ode45(@(t,y) y-t , tspan, y0, opts);

e = 2.7182818;
exact = t+((e)/(e^(2)-1))*(e.^(-t)-e.^(t));

plot(t,y,'-o',t,exact,'-*')
