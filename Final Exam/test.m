

k = 0.026;
pmax = 12000000000;
t0 = 1950;
p0 = 2555000000;
tf = 2050;

h = 0.1;

PAnalitic = 12000000000/ (1+ ((12000000000/2555000000)-1)*exp(-0.026*(2050-1950)) )

[tspan,PNumeric] = ralstons(fun,t0,p0,tf,h);

function funct = fun(x,y)           
    fun = 12000000000/ (1+ ((12000000000/y)-1)*exp(-0.026*(x-1950)) );
end

function [x,y] = ralstons(fun,x0,y0,xN,dx)
% ralstons: Solves IVP using Ralston's method
% [x,y] = ralstons(fun,x0,y0,xN,dx):
%   Solves the given IVP using Ralston's second order method which 
%   is a Runge-Kutta method for approximating the solution of the 
%   initial value problem y'(x) = f(x,y);  y(x0) = y0 which evaluates the
%   integrand,f(x,y), twice for each step.
%
% input: 
%   fun = An anonymous function describing y'(x) = f(x,y)
%   x0  = Initial value of x
%   y0  = Intial value of y at x0
%   xN  = Final value of x
%   dx  = Step size
% output:
%   x = Values of x
%   y = Values of y calculated at all x
%
% Author: Divyaprakash
%         Mechanical Engineer
% e-mail: divyaprakash.poddar@gmail.com
% Date  : 28 June 2021
    x = x0:dx:xN;
    nx = numel(x);
    y = zeros(1,nx);
    y(1) = y0;
    for i = 1:nx-1
        k1 = dx*fun(x(i),y(i));
        k2 = dx*fun(x(i)+2*dx/3,y(i)+2*k1/3);
        
        y(i+1) = y(i) + 1/4*(k1+3*k2);
    end
end