% Shooting Method
% Trial and error guesses until line matches that of exact solution

tspan = [0 1];
opts = odeset('RelTol',1.0e-4);

% guess 1
v0 = 1; 
y0 = [0 , v0];
[t,y] = ode45(@(t,y) ftheta(t,y), tspan, y0, opts);

% guess 2
v0 = 0.15; 
y0 = [0 , v0];
[t2,y2] = ode45(@(t,y) ftheta(t,y), tspan, y0, opts);

% exact solution (given in problem)
e = 2.7182818;
exact = t+((e)/(e^(2)-1))*(e.^(-t)-e.^(t)); % given exact solution 

plot(t2,y2(:,1),'-x',t,exact,'-*')

function sol = ftheta(t, theta)
% theta = (T, y)
dTdy = theta(2);
dydx = theta(1) - t;
sol = [dTdy; dydx];
end