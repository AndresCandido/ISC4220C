

x0 = [-1;1];              % initial guesses
tol = 1e-4;               % tolerance
[x, f, n] = bfgs(@fun, x0, tol)


function funct = fun(x)
funct = x(1) + 2*exp(x(2)); % input function here
end

% BFGS Demo: use as [x f n] = bfgs([5;1], 1e-3);
function [xopt, fopt, nopt] = bfgs(f, x0, tol)
x = x0;
n = length(x);
B = eye(n);
k = 0;

c = norm(gradient(f(x)))
    while(norm(gradient(f(x))) > tol) % Need to make gradf ~ 0
    df = gradient(gradient(f(x)));
    s = B \ (-df);
    x = x + s;
    y = gradient(f(x)) - df;
    B = B + (y*y')/(y'*s) - (B*s*s'*B)/(s'*B*s);
    k = k + 1;
    end
xopt = x; fopt = f(x); nopt = k;
end