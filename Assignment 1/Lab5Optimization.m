% Andres Candido ----- Lab 5: Optimization

clear all
clc
%----------------------------   Part 2-a  -----------------------------------%
%[x,y] = meshgrid(-10:10,-10:10);
%F = ((1-x).^2)+(100*((y-(x.^2)).^2));
%surf(x,y,F)
%----------------------------   Part 2-b  ---------------------------------%
syms x y;
F = ((1-x).^2)+(100*((y-(x.^2)).^2));
g = gradient(F,[x,y])
h = jacobian(gradient(F)) % this is the hessian


