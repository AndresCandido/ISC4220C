% Slice up time, and preallocate arrays
t0 = 0.; Tmax = 4*pi; dt = 0.1;         % dt is the step size

npts = round(Tmax/dt + 1);
t = zeros(npts, 1);
x = zeros(npts, 1);
v = zeros(npts, 1);

% Initial conditions
t(1) = 0.; x(1) = 1; v(1) = 0.;

% Time-Stepping
for i = 2:npts
yold = [x(i-1); v(i-1)];
ynew = midpoint(@func, t(i-1), yold, dt); % function handle here!
t(i) = t(i-1) + dt;
x(i) = ynew(1);
v(i) = ynew(2);
end

plot(t, x, 'go-'); hold on;
plot(t, v, 'b--');
legend('x','v')
xlabel('t')
ylabel('x, v')
hold off;

%
% Define the function yp = f(t, y);
% For this function "t" is not really required!
%
function yp = func(t, y)
yp = zeros(size(y));

m = 1; % ------------------- Add adition parameter of the function here
k = 1; 
u = 25;

x = y(1); % I made these definitions only for clarity
v = y(2); % can directly use y(1), y(2) below.


yp(1) = v; % dx/dt
yp(2) = (-u*v-k*x)/m ; % dv/dt     -----   Change the function here
end

%
% One Step of Mid-point Method
%
function ynew = midpoint(f, told, yold, h)
ymid = yold + h/2 * f(told, yold);
ynew = yold + h * f(told + h/2, ymid);
end

