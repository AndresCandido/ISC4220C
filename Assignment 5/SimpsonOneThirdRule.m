% Ask for user input
% Lower bound (a)
a = 0;

% Upper bound (b)
b = 2;

% Subintervals
N = 4;

% Finding h
h=(b-a)/N; 

% Finding the values of x for each interval
x=linspace(a,b,N);

% Calculating the integral
I = 0; 
for i = 1:N-1
    I = I + h/3*(f(x(i)) + 4*f((x(i)+x(i+1))/2) + f(x(i+1)));
end

disp(I)


% Defining function
function funct = f(x)           
funct = exp(-x^2);
end