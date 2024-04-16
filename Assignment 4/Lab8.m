% Lab 8 - Differentiation

% Part 1: 

%x = 0.5;
%x0 = pi/3;
%h = logspace(-15,-1);

%for i=1:50
%    centered(i) = CDfprime(x0,h(i));
%    forward(i) = FDfprime(x0,h(i));

%    CenterError(i) = abs(x - centered(i));
%    ForwardError(i) = abs(x - forward(i));
%end

%loglog(h,CenterError,h,ForwardError)
%legend('Centered Diff','Forward Diff','Location','northwest')


% Part 2:

x0 = 0;
h = logspace(-10,0,100);

for i=1:100
    centered(i) = FourthCDfprime(x0,h(i));
    CenterError(i) = abs(exp(x0) - centered(i));

end

loglog(h,CenterError)
legend('Centered Diff','Location','northwest')



% Used Functions

function funct = u(x)           
funct = exp(x);
end

function FourthOrdercenteredDiff = FourthCDfprime(x,h)
FourthOrdercenteredDiff = ...
    ( (-1*u(x-2*h))+(16*u(x-h))-(30*u(x))+(16*u(x+h))-(u(x+2*h)) ) /(12*(h^2));
end

function funct = f(x)           
funct = sin(x);
end

function centeredDiff = CDfprime(x,h)
centeredDiff = (f(x+h)-f(x-h))/(2*h);
end

function forwardDiff = FDfprime(x,h)
forwardDiff = (f(x+h)-f(x))/(h);
end


