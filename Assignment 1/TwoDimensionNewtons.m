% 2D Newton's Method ---- Lab 5: Part 2-c 

% when using Newton's method for multi-dimensional functions (2d, 3d, etc),
% we want to find to minimum instead of the root.

clear all
clc

x0 = [-1;1];         % initial guess for [x,y]
tol = 0.000001;
alpha = 0;         % alpha value helps converge faster

for iter = 1:50   % max number of allowed iterations for this assignment
    x0 = x0 - inv(f2prime(x0(1),x0(2)))*fprime(x0(1),x0(2));
end

x0             % see values of x and y at minimum
f(x0(1),x0(2)) % see value of minimum in the function


function funct = f(x,y)           
funct = ((1-x).^2)+(100*((y-(x.^2)).^2));
end

function funct = fprime(x,y)

dfdx = 2*x - 400*x*(- x^2 + y) - 2;
dfdy = - 200*x^2 + 200*y;

funct = [dfdx;dfdy];
end

function funct = f2prime(x,y)           
 
df2dx2 = 1200*x^2 - 400*y + 2;
df2dxdy = -400*x;
df2dydx = -400*x;
df2dy2 = 200;

funct = [df2dx2 df2dxdy ; df2dydx df2dy2];
end